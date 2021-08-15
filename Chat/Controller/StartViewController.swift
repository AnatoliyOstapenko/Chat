//
//  ViewController.swift
//  Chat
//
//  Created by MacBook on 01.08.2021.
//

import UIKit
//after CLTypingLabel class added from CocoaPods, it's needed to import CLTypingLabel
import CLTypingLabel


class StartViewController: UIViewController {
    
  //after CLTypingLabel class added from CocoaPods, it's needed to change UILabel to CLTypingLabel
    @IBOutlet weak var chatLabel: CLTypingLabel!
    
//MARK: - Block of code to hide navigation bar in StartViewController
    
    override func viewWillAppear(_ animated: Bool) {
        // call super when override func from super class
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        // call super when override func from super class
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // add string to a new CLTypingLabel
        chatLabel.text = "let's chat"
        // hide top navigation bar
        //navigationController?.isNavigationBarHidden = true
        
    }

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    
    
    
    //MARK: - I left this func to fresh my memory when animation func can be needed
    // func for animation letters showing up
    func animationChatLabel() {
        chatLabel.text = ""
        // index is needed to make a pause
        var index: Double = 0.0
        let titleText = "C  H  A  T"
        for letter in titleText {
            // set timer interval
            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false) { (timer) in
                // add chatLabel next a letter from tittleText, use self cause it in closure
                self.chatLabel.text?.append(letter)
            }
            index += 1
        }
    }
}

