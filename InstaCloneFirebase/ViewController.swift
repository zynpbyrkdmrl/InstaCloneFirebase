//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Zeynep Bayrak Demirel on 17.04.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }

    @IBAction func signInClıcked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != ""{
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else {
            makeAlert(titleInput: "Error", messageInput: "Username/Password")
        }
        
    }
    
    
    
    
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
        
        //Auth sınıfından auth objesi oluşturmak gibi
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in //closure yapısı. input veriyorum bana bir output veriyor. iki tane output var hatta burda 1 authdata, 2 error
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")//localizedDescripton firebase in kendi hata mesajı kullanıcıya gösterilir.
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else { // şifre ve e-mail boşsa uyarı mesajı göstericez.
            makeAlert(titleInput: "Error", messageInput: "Username/Password")
        }
        
    }
    
    
    func makeAlert (titleInput: String, messageInput: String) { //alert ı fonksiyona atadık cünkü sürekli kullncaz.
        let alert = UIAlertController (title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction (title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

    


