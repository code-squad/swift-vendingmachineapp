//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vendingMachine = VendingMachine()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        vendingMachine = DataManager.load() ?? VendingMachine()
        print("init")
    return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // fore to back
        DataManager.save(data: vendingMachine)
        print("willresign")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // fore to back 2
        print("didEnterBack")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //back to fore
        vendingMachine = DataManager.load() ?? VendingMachine()
        print("enterfore")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //back to fore 2
        print("didbecomeactive")
    }
}

