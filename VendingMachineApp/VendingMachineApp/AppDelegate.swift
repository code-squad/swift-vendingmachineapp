//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine: VendingMachine!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if let vendingMachine = VendingMachineDataManager.load() {
            self.vendingMachine = vendingMachine
        } else {
            self.vendingMachine = VendingMachine()
        }
        return true
    }
}

