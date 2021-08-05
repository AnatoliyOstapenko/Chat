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
        //changed the background color
        chatTableView.backgroundColor = UIColor.white
        // chenged color of navigation bar
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.8980392157, blue: 0.8588235294, alpha: 1)
        
        
        
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
    
    // set numbers of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    // using cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // set "ReusableCell" cell as K.cellIdentifier / indexPath point to row
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        //changed the text color
        cell.textLabel?.textColor = #colorLiteral(red: 0.2666666667, green: 0.6039215686, blue: 0.6274509804, alpha: 1)
        cell.textLabel?.text = messages[indexPath.row].body
        return cell
    }
    
    
}

