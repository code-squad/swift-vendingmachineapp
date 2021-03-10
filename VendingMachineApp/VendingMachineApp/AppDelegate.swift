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
        let loadData = UserDefaults.standard.data(forKey: "vendingMachine") ?? Data()
        let loadMachine =  ObjectArchive.load(with: loadData)
        self.vendingMachine = loadData.isEmpty ? VendingMachine() : loadMachine
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication){
        UserDefaults.standard.setValue(ObjectArchive.save(with: vendingMachine ?? VendingMachine()), forKey: "vendingMachine")
    }

}

