//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 9. 13..
//  Copyright © 2018년 Drake. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var sharedVendingMachine = VendingMachine.shared()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
            
        if let loadedVendingMachine = VendingMachineDataManager.loadVendingMachineData() {
            sharedVendingMachine = loadedVendingMachine
        }        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        VendingMachineDataManager.saveVendingMachineData(sharedVendingMachine)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        VendingMachineDataManager.saveVendingMachineData(sharedVendingMachine)
    }


}

