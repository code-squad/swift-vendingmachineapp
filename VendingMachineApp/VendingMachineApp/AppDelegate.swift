//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var vendingMachine: VendingMachine!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.vendingMachine = ArchivingManager.loadData(forKey: "vendingMachine")
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }
}

