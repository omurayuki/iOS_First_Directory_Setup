//
//  AppDelegate.swift
//  LogTummy-iOS
//
//  Created by オムラユウキ on 2020/02/05.
//  Copyright © 2020 オムラユウキ. All rights reserved.
//

import UIKit
//import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        #if DEBUG
//            let filePath = Bundle.main.path(forResource: "GoogleService-debug-Info", ofType: "plist")
//        #else
//            let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
//        #endif
//        let options = FirebaseOptions(contentsOfFile: filePath!)
//        FirebaseApp.configure(options: options!)
        
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
