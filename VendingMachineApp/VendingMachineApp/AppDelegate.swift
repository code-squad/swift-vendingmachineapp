//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let manager = VendingMachineManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        manager.loadData()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        manager.loadData()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        manager.saveData()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        manager.saveData()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
       
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}

