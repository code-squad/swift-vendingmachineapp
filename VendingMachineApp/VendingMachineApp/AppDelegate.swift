//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var vendingMachine : UserModable!

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool  {
        let viewController = window?.rootViewController as! VendingMachinedable
        vendingMachine = DataManager.load()
        viewController.setVendingMachine(vendingMachine)
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication){
        DataManager.save(vendingMachine)
    }
}

