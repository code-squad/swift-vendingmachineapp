//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 8..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let machineStore: MachineStore = MachineStore()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let userVC = window?.rootViewController as? UserViewController {
            userVC.machine = machineStore.loadData()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        machineStore.saveChanges()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        machineStore.saveChanges()
    }

}
