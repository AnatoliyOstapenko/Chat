//
//  LoginViewController.swift
//  Chat
//
//  Created by MacBook on 01.08.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginWarningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        //created constants email and password to transfer them to Firebase
        // unwraped them beause both of them are optional

        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Error in loginButtonPressed")
            return
        }
        //login for a current user (https://firebase.google.com/docs/auth/ios/password-auth?authuser=0)
        // deleted guard let strongSelf = self else { return } and extra useless things
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
          
          
            if let error = error {
                self.loginWarningLabel.text = error.localizedDescription
            } else {
                self.performSegue(withIdentifier: "loginToChat", sender: self)
            }
            
        }
    }
    

}
