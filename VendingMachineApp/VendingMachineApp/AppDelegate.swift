//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 5..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var machineStore = MachineStore()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let decodedData = machineStore.loadMachine() else { return true }
        VendingMachine.loadInstance(decodedData)
        let viewController = window?.rootViewController as? ViewController
        viewController?.vendingMachine = VendingMachine.shared()
        return true                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        machineStore.saveChanges(VendingMachine.shared())
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        machineStore.saveChanges(VendingMachine.shared())
    }


}

