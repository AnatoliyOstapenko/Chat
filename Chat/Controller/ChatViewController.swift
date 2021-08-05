//
//  ChatViewController.swift
//  Chat
//
//  Created by MacBook on 01.08.2021.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    var messages: [Message] = [
        
        Message(sender: "1@mail.com", body: "Hi there!"),
        Message(sender: "2@mail.com", body: "Hello Sir!"),
        Message(sender: "1@mail.com", body: "How are doing?")
    ]
    
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var chatTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //triggered UITableViewDataSource protocol
        chatTableView.dataSource = self
        
        // add a title in top bar
        title = "C  H  A  T"
        // hide "go back" button from screen
        navigationItem.hidesBackButton = true
    }

    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
       
        //logout for a current user (https://firebase.google.com/docs/auth/ios/password-auth?authuser=0)
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        // Poped the first top view controller from the navigation stack and updates the display.
        navigationController?.popToRootViewController(animated: true)
        
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
        
    }
}
//added UITableViewDataSource protocol to manage data and provide cells for a table view.
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
