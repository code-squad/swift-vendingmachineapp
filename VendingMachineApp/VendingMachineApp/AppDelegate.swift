//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var vendingMachine: VendingMachine!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        vendingMachine = loadVendingMachineData()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        saveVendingMachineData(vendingMachine)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        saveVendingMachineData(vendingMachine)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        saveVendingMachineData(vendingMachine)
    }
    
    func saveVendingMachineData(_ vendingMachine: VendingMachine) {
        var vendingMachineData: Data!
        do {
            vendingMachineData = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
        } catch {
            print("Error")
            return
        }
        UserDefaults.standard.set(vendingMachineData, forKey: "vendingMachine")
    }
    
    func loadVendingMachineData() -> VendingMachine {
        guard let data = UserDefaults.standard.object(forKey: "vendingMachine") else {
            return VendingMachine()
        }
        do {
            let vendingMachineData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as! Data) as? VendingMachine
            return vendingMachineData ?? VendingMachine()
        } catch {
            print("Error")
        }
        return VendingMachine()
    }

}

