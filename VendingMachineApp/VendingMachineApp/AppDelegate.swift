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
    private var vendingMachine: VendingMachine! = VendingMachine.sharedInstance
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    var window: UIWindow?
    
    private func encodeVendingMachineJsonData(){
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        guard let jsonData = try? encoder.encode(vendingMachine)else{
            return
        }
        UserDefaults.standard.set(jsonData, forKey: "vendingMachine")
    }
    
    private func flushPreviousVendingMachineData(){
        UserDefaults.standard.set(nil, forKey: "vendingMachine")
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
        vendingVC.vendingMachine = vendingMachine
    }
    
    private func decodeVendingMachineJsonData() {
        guard let jsonData = loadData() else{
            return
        }
        guard let machine = decodeJsonData(jsonData) else{
            return
        }
        vendingMachine = machine
        injectMachineToVendingViewController()
        return
    }
    
    private func loadData() -> Data? {
        guard let jsonData = UserDefaults.standard.value(forKey: "vendingMachine") as? Data else{
            return nil
        }
        return jsonData
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        flushPreviousVendingMachineData()
        decodeVendingMachineJsonData()
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        encodeVendingMachineJsonData()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        decodeVendingMachineJsonData()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        encodeVendingMachineJsonData()
    }
}

