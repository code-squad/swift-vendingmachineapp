//
//  AppDelegate.swift
//  VendinMachineApp
//
//  Created by user on 2021/02/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine = VendingMachine()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if let data = UserDefaults.standard.data(forKey: "vendingMachine3"), let vendingMachineDate = ArchiveManager.unarchive(with: data) {
            vendingMachine = vendingMachineDate
        }
        return true
    }
    

}

