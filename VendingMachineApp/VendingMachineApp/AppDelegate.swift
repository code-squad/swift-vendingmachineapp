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
    var vendingMachine : VendingMachine?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool  {
        vendingMachine = DataManager().save()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication){
        DataManager().load(vendingMachine: vendingMachine ?? VendingMachine())
    }

}

