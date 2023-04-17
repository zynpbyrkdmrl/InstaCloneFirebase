//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Zeynep Bayrak Demirel on 17.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClıcked(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    @IBAction func signUpClicked(_ sender: Any) {
    }
    
}

    
