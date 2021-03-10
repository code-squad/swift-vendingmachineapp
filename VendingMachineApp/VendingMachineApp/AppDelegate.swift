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
    var vendingMachine = VendingMachine()

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool  {
        guard let vendingMachine = ObjectArchive.load(with: UserDefaults.standard.data(forKey: "vendingMachine") ?? Data()) else { return true }
        self.vendingMachine = vendingMachine
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication){
        UserDefaults.standard.setValue(ObjectArchive.save(with: vendingMachine), forKey: "vendingMachine")
    }

}

