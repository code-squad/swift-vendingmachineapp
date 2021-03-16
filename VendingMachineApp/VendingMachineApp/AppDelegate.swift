//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vendingMachine: VendingMachine!
    private let archivingCenter = ArchivingCenter()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.vendingMachine = archivingCenter.loadVendingMachine()
        return true
    }
    
    func save() {
        archivingCenter.save(vendingMachine)
    }
}
