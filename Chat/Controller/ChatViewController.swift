//
//  ChatViewController.swift
//  Chat
//
//  Created by MacBook on 01.08.2021.
//

import UIKit
import Firebase


class ChatViewController: UIViewController {
    
    // Initialize an instance of Cloud Firestore
    let db = Firestore.firestore()
    // create array to use struct Message
    var messages: [Message] = []
    
    
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

        // changed color of navigation bar
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.8980392157, blue: 0.8588235294, alpha: 1)
        
        // Registered a nib object containing a cell with the table view under a specified identifier
        // registered TableViewCell.xib
        // identifier name should be the same TableViewCell in Main.Storyboard - "ReusableCell"
        chatTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        // switch to Light Mode screen (avoid dark background table view)
        overrideUserInterfaceStyle = .light
        // activate loading messages
        loadMessage()
    }

    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        // get message text from TextField when button pressed and get email of sender from Firebase
        // unwraping them
        guard let messageBody = chatTextField.text, let messageSender = Auth.auth().currentUser?.email else {
            return
        }
        // dispatch message text to Firebase. set a date 1970 to get messages in order
        db.collection("messages").addDocument(data: ["sender": messageSender, "body": messageBody, "date": Date().timeIntervalSince1970]) { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                //clear the chatTextField when user pressed button "sendButtonPressed"
                // set main dispatch queue (GCD)
                DispatchQueue.main.async {
                    self.chatTextField.text = ""
                }
                
                print("successfuly complete")
            }
            
        }
    }
    
        

    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
       
        //logout for a current user in Firebase (https://firebase.google.com/docs/auth/ios/password-auth?authuser=0)
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        // send user to the first view controller from the navigation stack and updates the display.
        navigationController?.popToRootViewController(animated: true)
        
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
        
    }
    // Retrieving an information from Cloud Firestore
    func loadMessage() {

        db.collection("messages").order(by: "date").addSnapshotListener { (querySnapshot, error) in
            
            // clear a privious range of messages, but leave all range you sent to Firebase
            self.messages.removeAll()
            // unwraping error to check nil is available
            if let error = error {
                print(error.localizedDescription)
            } else {
                // unwraping querySnapshot
                guard let snapshotDocuments = querySnapshot?.documents else {
                    return
                }
                
                for doc in snapshotDocuments {
                        
                        let data = doc.data()
                        guard let messageSender = data["sender"] as? String, let messageBody = data["body"] as? String else {
                            return
                        }
                        
                        let newMessage = Message(sender: messageSender, body: messageBody)
                        self.messages.append(newMessage)
                        
                        // set main dispatch to avoid app freezing in case of bad internet connection
                        DispatchQueue.main.async {
                            // retrieved the last messages from Firebase
                            // Reload data (add a new row) table view.
                            self.chatTableView.reloadData()
                            
                            // set indexPath to specify quantity attributes in array and quantity section of TableView
                            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                            // fix sticky messages at the bottom of the screen
                            self.chatTableView.scrollToRow(at: indexPath, at: .top, animated: true)
                        }
                        
                    }
                
                
                
            }
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
    
    // set cell and changing UI by TableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create message to get acces to row in Table View
        let message = messages[indexPath.row]
        
        // Returns a reusable table-view cell object as! MessageCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! TableViewCell
        
        //change background color to white
        tableView.backgroundColor = .white
        
        // dispatch a new text from message array (via Message struct) and show it on the screen (TableViewCell)
        cell.cellLabel?.text = message.body
        
        
        // check if the sender in array is related sender in Fairbase
        
        if message.sender == Auth.auth().currentUser?.email {
            // user is a sender
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.cellView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.8980392157, blue: 0.8588235294, alpha: 1)
            cell.cellLabel.textColor = #colorLiteral(red: 0.2666666667, green: 0.6039215686, blue: 0.6274509804, alpha: 1)
        } else {
            // coresspondent is a sender
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.cellView.backgroundColor = #colorLiteral(red: 0.3921568627, green: 0.7882352941, blue: 0.8117647059, alpha: 1)
            cell.cellLabel.textColor = .white
        }
        
        return cell
    }
    
    
}

