//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by hw on 22/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private (set) var vendingMachine: VendingMachine!
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let jsonData = UserDefaults.standard.value(forKey: "vendingMachine") as? Data else{
            vendingMachine = MockVendingMachineCreator.initializeVendingMachine()
            return true
        }
        if let machine = try? decoder.decode(VendingMachine.self, from: jsonData) {
            vendingMachine = machine
            return true
        }
        vendingMachine = MockVendingMachineCreator.initializeVendingMachine()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        guard let jsonData = try? encoder.encode(vendingMachine)else{
            return
        }
        let jsonString = String(data: jsonData, encoding: .utf8 )
        UserDefaults.standard.set(jsonData, forKey: "vendingMachine")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        guard let jsonData = UserDefaults.standard.value(forKey: "vendingMachine") as? Data else{
            vendingMachine = MockVendingMachineCreator.initializeVendingMachine()
            return
        }
        if let machine = try? decoder.decode(VendingMachine.self, from: jsonData) {
            vendingMachine = machine
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        guard let jsonData = try? encoder.encode(vendingMachine)else{
            return
        }
        let jsonString = String(data: jsonData, encoding: .utf8 )
        UserDefaults.standard.set(jsonData, forKey: "vendingMachine")
    }
}

