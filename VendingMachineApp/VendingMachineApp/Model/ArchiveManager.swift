//
//  ArchiveManager.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/17.
//

import Foundation

class ArchiveManager {
    
    static func archive(data: VendingMachine) {
        do {
            let encoded = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
            UserDefaults.standard.set(encoded, forKey: "VendingMachine")
        } catch {
            print(error)
        }
    }
    
    static func unarchive() -> VendingMachine {
        do {
            let decoded = UserDefaults.standard.value(forKey: "VendingMachine") as? Data ?? Data()
            let vendingMachine = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as? VendingMachine
            
            return vendingMachine == nil ? VendingMachine() : vendingMachine!
        } catch {
            print(error)
        }
        return VendingMachine()
    }
    
}
