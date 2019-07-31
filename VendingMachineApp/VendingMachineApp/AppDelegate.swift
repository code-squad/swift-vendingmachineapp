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
        guard let jsonData = try? encoder.encode(vendingMachine)else{
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vendingVC = storyboard.instantiateViewController(withIdentifier: "VendingViewController") as! VendingViewController
        vendingVC.self.vendingMachine = self.vendingMachine
    }
    
    private func decodeVendingMachineJsonData() -> VendingMachine {
        let dummyMachine = MockVendingMachineCreator.initializeVendingMachine()
        guard let jsonData = loadData() else{
            return dummyMachine
        }
        guard let machine = decodeJsonData(jsonData) else{
            return dummyMachine
        }
        injectMachineToVendingViewController()
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
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        encodeVendingMachineJsonData()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        vendingMachine = decodeVendingMachineJsonData()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        encodeVendingMachineJsonData()
    }
}

