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
    var vendingMachine : VendingMachined!

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool  {
        var viewController = window?.rootViewController as! VendingMachinedable
        vendingMachine = DataManager.load()
        viewController.vendingMachine = vendingMachine
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication){
        DataManager.save(vendingMachine as! VendingMachine)
    }

}

