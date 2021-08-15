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
        
        // chenged color of navigation bar
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.8980392157, blue: 0.8588235294, alpha: 1)
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
                // switch on a new screen by segue
                self.performSegue(withIdentifier: "loginToChat", sender: self)
            }
            
        }
    }
    

}
