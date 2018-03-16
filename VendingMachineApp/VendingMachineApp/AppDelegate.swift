//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 8..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var vendingMachine = VendingMachine()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func sharedInstance() -> VendingMachine {
        return vendingMachine
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let data = NSKeyedArchiver.archivedData(withRootObject: vendingMachine)
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        let data = NSKeyedArchiver.archivedData(withRootObject: vendingMachine)
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        if let data = UserDefaults.standard.data(forKey: "vendingMachine") {
            vendingMachine = (NSKeyedUnarchiver.unarchiveObject(with: data) as? VendingMachine)!
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        if let data = UserDefaults.standard.data(forKey: "vendingMachine") {
            vendingMachine = (NSKeyedUnarchiver.unarchiveObject(with: data) as? VendingMachine)!
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        let data = NSKeyedArchiver.archivedData(withRootObject: vendingMachine)
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }

}
