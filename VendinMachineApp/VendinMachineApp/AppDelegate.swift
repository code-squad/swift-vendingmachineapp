//
//  AppDelegate.swift
//  VendinMachineApp
//
//  Created by user on 2021/02/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine = VendingMachine()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if let data = UserDefaults.standard.data(forKey: "vendingMachine3"), let vendingMachineDate = unarchive(with: data) {
            vendingMachine = vendingMachineDate
        }
        return true
    }
    
    func archive(with things: VendingMachine) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        }
        catch {
            print(error)
        }
        return Data()
    }
    
    func unarchive(with things: Data) -> VendingMachine? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(things)
            return object as? VendingMachine
        }
        catch {
            print(error)
        }
        return nil
    }
}

