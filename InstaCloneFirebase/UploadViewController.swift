//
//  UploadViewController.swift
//  InstaCloneFirebase
//
//  Created by Zeynep Bayrak Demirel on 18.04.2023.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage



class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func chooseImage () {
        //kullanıcının kütüphanesine erişmek için pickerController
        let pickerController = UIImagePickerController()
        pickerController.delegate = self // pickerController ın fonksiyonlarını çağırabileceğim bir ortam yaratmak için
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    //kullanıcı resmi seçince ne olacak onu söylememiz gerekiyor.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info [.originalImage] as? UIImage // seçtiğim görsel imageViewa aktarılcak!
        self.dismiss(animated: true, completion: nil) // açtığım picker ı kapatmak için.
    }
    
    func makeAlert (titleInput : String, messageInput : String){
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func uploadButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference() // bu referansı kullanarak hangi klasörle çalışacagımızı, nereye kaydedeceğimizi belirtiyoruz. Aşağıdaki gibi.
        let mediaFolder = storageReference.child("media")
        // storageReference deyince firebase storage kısmına yönlendiriyor, .child"media" deyince oluşturdugumuz media klasörü, .childmedia.child... diye gidebilirim.klasöre ulaştık şimdi fotoğrafı kaydetmemiz lazım, bunun için de veriye çevirmeliyiz. UIImage olarak kaydedemiyoruz.
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("\(uuid).jpg") //görselin referansını oluşturuyoruz.
            imageReference.putData(data, metadata: nil) { (metadata, error) in //içinde completin olan fonksiyonu seçtik ki bir hava var mı kaydedebildik mi görelim.
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            //DATABASE
                            
                            let firestoreDatabase = Firestore.firestore()
                            let firestoreReferense : DocumentReference?
                            let firestorePost = ["imageUrl" : imageUrl! , "postedBy" : Auth.auth().currentUser!.email!, "postComment" : self.commentText.text!, "date" : FieldValue.serverTimestamp(), "likes" : 0] as [String : Any]
                            
                            firestoreReferense = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { (error) in
                                
                                if error != nil {
                                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                                }else {
                                    self.imageView.image = UIImage(named: "select.png")
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0 // 0 beni Feed'e götürür.
                                }
                            })
                            
                            
                            
                            
                            
                        }
                    }
                    }
                }
                
            }
            
        }
        
        
        
        
        
    }
    
    

