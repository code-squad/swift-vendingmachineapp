//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine: VendingMachine!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        vendingMachine = VendingMachineDataCenter.load()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        VendingMachineDataCenter.save(to: vendingMachine)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        VendingMachineDataCenter.save(to: vendingMachine)
    }
}

