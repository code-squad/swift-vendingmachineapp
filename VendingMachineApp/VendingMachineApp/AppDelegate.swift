//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine: VendingMachine!
    
    public func loadVendingMachineData() -> VendingMachine {
        guard let data = UserDefaults.standard.object(forKey: "vendingMachine") else { return VendingMachine() }
        do {
            let vendingMachine = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as! Data) as? VendingMachine
            return vendingMachine ?? VendingMachine()
        } catch {
            print(error.localizedDescription)
        }
        return VendingMachine()
    }
    
    public func saveVendingMachineData(_ vendingMachine: VendingMachine) {
        var data: Data!
        do {
            data = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            
        } catch {
            print(error.localizedDescription)
            return
        }
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        vendingMachine = loadVendingMachineData()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        saveVendingMachineData(vendingMachine)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        saveVendingMachineData(vendingMachine)
    }
}


