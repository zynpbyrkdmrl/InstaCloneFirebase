//
//  UploadViewController.swift
//  InstaCloneFirebase
//
//  Created by Zeynep Bayrak Demirel on 18.04.2023.
//

import UIKit

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

    @IBAction func uploadButtonClicked(_ sender: Any) {
    }
    
    
}
