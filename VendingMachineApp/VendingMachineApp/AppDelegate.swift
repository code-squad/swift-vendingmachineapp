//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine: VendingMachine!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        guard let vendingMachine = vendingMachineLoad(with: UserDefaults.standard.data(forKey: "vendingMachine") ?? Data()) else {
            self.vendingMachine = VendingMachine()
            return true
        }
        self.vendingMachine = vendingMachine
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        UserDefaults.standard.setValue(vendingMachineSave(with: vendingMachine), forKey: "vendingMachine")
    }
    
    
    private func vendingMachineLoad(with text: Data) -> VendingMachine? {
        guard let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
         else {
            return nil
        }
        return object as? VendingMachine
    }
    
    private func vendingMachineSave(with data: VendingMachine) -> Data {
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false) else {
            return Data()
        }
        return data
    }
}

