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
    var window: UIWindow?
    
    /// injection
    private func injectMachineToVendingViewController(){
        guard let vendingVC = self.window?.rootViewController! as? VendingViewController else {
            return
        }
        vendingVC.configure(VendingMachine.sharedInstance)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        injectMachineToVendingViewController()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        VendingMachine.encode()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        injectMachineToVendingViewController()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        VendingMachine.encode()
    }
}

