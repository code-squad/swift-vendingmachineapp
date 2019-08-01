//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by hw on 22/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let dataController: VendingMachineDataController = VendingMachineDataController.shared
    var window: UIWindow?
    
    /// injection
    private func injectMachineToVendingViewController(_ vendingMachine: VendingMachine){
        guard let vendingVC = self.window?.rootViewController! as? VendingViewController else {
            return
        }
        vendingVC.configure(vendingMachine)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let vendingMachine = dataController.fetchData() else{ return true }
        injectMachineToVendingViewController(vendingMachine)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        dataController.encode()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        guard let vendingMachine = dataController.fetchData() else{ return }
        injectMachineToVendingViewController(vendingMachine)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        dataController.encode()
    }
}

