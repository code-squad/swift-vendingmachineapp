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

    override init() {
        // 저장된 자판기가 있을경우 객체를 교체한다
        if let loadedVendingMachine = VendingMachineDataManager.loadVendingMachineData() {
            VendingMachine.loadVendingMachine(savedVendingMachine: loadedVendingMachine)
        }
    }
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        VendingMachineDataManager.saveVendingMachineData(VendingMachine.shared())
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        VendingMachineDataManager.saveVendingMachineData(VendingMachine.shared())
    }
}

