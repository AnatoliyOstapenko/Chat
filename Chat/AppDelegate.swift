//
//  AppDelegate.swift
//  Chat
//
//  Created by MacBook on 01.08.2021.
//

import UIKit

// import Firebase
import Firebase

//after IQKeyboardManager class added from CocoaPods, it's needed to import IQKeyboardManager
import IQKeyboardManager


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // The entry point of Firebase SDKs
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
        // Initialize an instance of Cloud Firestore
        let db = Firestore.firestore()
        print(db)
        
        // enabled IQKeyboardManager from CocoaPods
        IQKeyboardManager.shared().isEnabled = true
        
        // hide toolbar of keyboard in CocoaPods framework
        IQKeyboardManager.shared().isEnableAutoToolbar = false
        
        // Hide keyboard on touches outside textfield
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        
       
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

