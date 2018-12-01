//
//  VendingMachineDataManager.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 11. 16..
//  Copyright © 2018년 Drake. All rights reserved.
//

import Foundation

class VendingMachineDataManager {
    
    private static let dataKey = "dataKey"
    
    static func saveVendingMachineData(_ vendingMachine: VendingMachine) {
        let vendingMachineData = NSKeyedArchiver.archivedData(withRootObject: vendingMachine)
        UserDefaults.standard.set(vendingMachineData, forKey: dataKey)
    }
    
    static func loadVendingMachineData() -> VendingMachine? {
        guard let loaded: Data = UserDefaults.standard.data(forKey: dataKey) else { return nil }
        guard let vendingMachineData = NSKeyedUnarchiver.unarchiveObject(with: loaded) else { return nil }
        guard let vendingMachine = vendingMachineData as? VendingMachine else { return nil }
        return vendingMachine
    }
}
