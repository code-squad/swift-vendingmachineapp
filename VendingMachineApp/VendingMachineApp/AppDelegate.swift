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
    
    private func encodeVendingMachineJsonData(){
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        guard let jsonData = try? encoder.encode(vendingMachine)else{
            return
        }
        UserDefaults.standard.set(jsonData, forKey: "vendingMachine")
    }
    
    private func debugEncodingData(){
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        guard let jsonData = try? encoder.encode(vendingMachine) else{
            return
        }
        _ = String(data: jsonData, encoding: .utf8 )
    }
    
    private func decodeJsonData(_ jsonData: Data)-> VendingMachine? {
        guard let machine = try? decoder.decode(VendingMachine.self, from: jsonData) else{
            return nil
        }
        return machine
    }
    
    private func injectMachineToVendingViewController(){
        guard let vendingVC = self.window?.rootViewController! as? VendingViewController else {
            return
        }
        vendingVC.vendingMachine = self.vendingMachine
    }
    
    private func decodeVendingMachineJsonData() -> VendingMachine {
        let dummyMachine = MockVendingMachineCreator.initializeVendingMachine()
        guard let jsonData = loadData() else{
            return dummyMachine
        }
        guard let machine = decodeJsonData(jsonData) else{
            return dummyMachine
        }
        return machine
    }
    
    private func loadData() -> Data? {
        guard let jsonData = UserDefaults.standard.value(forKey: "vendingMachine") as? Data else{
            return nil
        }
        return jsonData
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        vendingMachine = decodeVendingMachineJsonData()
        injectMachineToVendingViewController()
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        encodeVendingMachineJsonData()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        vendingMachine = decodeVendingMachineJsonData()
        injectMachineToVendingViewController()

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        encodeVendingMachineJsonData()
    }
}

