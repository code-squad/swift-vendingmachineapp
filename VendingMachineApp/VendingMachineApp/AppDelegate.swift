//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine: VendingMachine?
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            try vendingMachine = AppDelegate.load()
        } catch {
            vendingMachine = AppDelegate.set()
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) {
        AppDelegate.archive(vendingMachine: vendingMachine)
    }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) {
        AppDelegate.archive(vendingMachine: vendingMachine)
    }
    
    static func archive(vendingMachine: VendingMachine?) {
        guard let vendingMachine = vendingMachine else { return }
        let vendingMachineEncoded = try? PropertyListEncoder().encode(vendingMachine)
        let success = try? NSKeyedArchiver.archivedData(withRootObject: vendingMachineEncoded, requiringSecureCoding: false)
        UserDefaults.standard.set(success, forKey:"VendingMachine")
    }
    
    enum Archive: Error {
        case noData
        case noLoad
    }
    
    static func load() throws -> VendingMachine {
        guard let data = UserDefaults.standard.data(forKey: "VendingMachine") else { throw Archive.noData }
        
        guard let vendingMachine = try NSKeyedUnarchiver
            .unarchiveTopLevelObjectWithData(data) as? VendingMachine else { throw Archive.noLoad }
 
//        let defaults = UserDefaults.standard
//        defaults.set(VendingMachine.self, forKey: "VendingMachine")
        
            return vendingMachine
    }

    static func set() -> VendingMachine {
        return VendingMachine.init(list: Inventory(list: [KeyId: Packages]()))
    }
    
}
