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
        Message(sender: "1@mail.com", body: "How are doing?"),
        Message(sender: "2@mail.com", body: "So what"),
        Message(sender: "1@mail.com", body: "Nothing to change"),
        Message(sender: "2@mail.com", body: "Is it bot"),
        Message(sender: "1@mail.com", body: "Awsome!")
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

        // chenged color of navigation bar
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.8980392157, blue: 0.8588235294, alpha: 1)
        
        // Registers a nib object containing a cell with the table view under a specified identifier
        // registered TableViewCell.xib
        // identifier name shold be the same TableViewCell in Main.Storyboard - "ReusableCell"
        chatTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        // switch to Light Mode screen (avoid dark background table view)
        overrideUserInterfaceStyle = .light
        
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

//MARK: TableView DataSource

//added UITableViewDataSource protocol to manage data and provide cells for a table view.
extension ChatViewController: UITableViewDataSource {
    
    // set numbers of rows in TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    // set cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Returns a reusable table-view cell object as! MessageCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! TableViewCell
        
        //change background color to white
        tableView.backgroundColor = .white
        
        cell.cellLabel?.text = messages[indexPath.row].body
        return cell
    }
    
    
}

