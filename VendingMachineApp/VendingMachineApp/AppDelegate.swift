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
    var vendingMachine = VendingMachine.sharedInstance()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let data = UserDefaults.standard.data(forKey: "vendingMachine") {
            let vending = (NSKeyedUnarchiver.unarchiveObject(with: data) as? VendingMachine)!
            VendingMachine.storedInstance(vending)
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        setUserDefault()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        setUserDefault()
    }
    
    func setUserDefault() {
        let data = NSKeyedArchiver.archivedData(withRootObject: VendingMachine.sharedInstance())
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }

}
