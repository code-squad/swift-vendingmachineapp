//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vendingMachine: VendingMachine?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if vendingMachine == nil {
            vendingMachine = VendingMachine()
        }
        
        if let savedData = UserDefaults.standard.object(forKey: "vendingMachine") {
            vendingMachine = Archiver.unarchive(with: savedData as! Data) as! VendingMachine
        }
        return true
    }
}

