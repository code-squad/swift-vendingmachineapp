//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2017. 12. 27..
//  Copyright © 2017년 Napster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if UserDefaults.standard.object(forKey: "vendingMachine") != nil {
            let userDefaultMachine = UserDefaults.standard.object(forKey: "vendingMachine")
            guard let vendingMachineData = userDefaultMachine as? Data else { return false }
            guard let unarchiveVendingMachine = NSKeyedUnarchiver.unarchiveObject(with: vendingMachineData) else { return false }
            guard let vendingMachine = unarchiveVendingMachine as? VendingMachine else { return false }
            VendingMachine.sharedInstance = vendingMachine
        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: VendingMachine.sharedInstance), forKey: "vendingMachine")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: VendingMachine.sharedInstance), forKey: "vendingMachine")
    }
}
