//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vendingMachine: VendingMachine?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        vendingMachine = ArchiveManager.unarchive()
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        ArchiveManager.archive(data: vendingMachine ?? VendingMachine())
    }
    
}

