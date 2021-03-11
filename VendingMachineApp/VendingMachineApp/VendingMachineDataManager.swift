//
//  VendingMachineDataManager.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/10.
//

import Foundation

class VendingMachineDataManager {
    
    private static let key = "vendingMachineDataManager"
    
    static func save(_ vendingMachine: VendingMachine) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func load() -> VendingMachine? {
        do {
            guard let loadedData: Data = UserDefaults.standard.data(forKey: key) else { return nil }
            guard let data = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(loadedData) else { return nil }
            guard let vendingMachine = data as? VendingMachine else { return nil }
            return vendingMachine
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
