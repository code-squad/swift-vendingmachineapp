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
        VendingMachine.loadInstance(of: VendingMachineDataCenter.loadVendingMachineData())
        vendingMachine = VendingMachine.default
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        VendingMachineDataCenter.saveVendingMachineData(vendingMachine)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        VendingMachineDataCenter.saveVendingMachineData(vendingMachine)
    }
}


