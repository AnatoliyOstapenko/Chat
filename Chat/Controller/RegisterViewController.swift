//
//  RegisterViewController.swift
//  Chat
//
//  Created by MacBook on 01.08.2021.
//

import UIKit
//import Firebase to use classes from it
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // chenged color of navigation bar
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.8980392157, blue: 0.8588235294, alpha: 1)
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        //created constants email and password to transfer them to Firebase
        // unwraped them beause both of them are optional
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Error in registerButtonPressed")
            return
        }
        //create a new user (https://firebase.google.com/docs/auth/ios/password-auth?authuser=0)
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // unwraping error (to check if it nil)
            if let error = error  {
                // used localizedDescription it explains what happened
                // show error on the screen
                self.warningLabel.text = "\(error.localizedDescription) \nPlease, try again"
            } else {
                // navigate to the ChatViewController (withIdentifier is segue's name, sender is self)
                self.performSegue(withIdentifier: "registerToChat", sender: self)
            }
            
            
        }
        
        
    }
}


