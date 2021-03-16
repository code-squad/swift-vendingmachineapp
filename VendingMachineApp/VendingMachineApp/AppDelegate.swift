//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine : VendingMachine!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        vendingMachine = SaveManager().loadvendingMachineData() ?? VendingMachine.init()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        SaveManager().savevendingMachineData(vendingMachine: vendingMachine)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        SaveManager().savevendingMachineData(vendingMachine: vendingMachine)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
}
