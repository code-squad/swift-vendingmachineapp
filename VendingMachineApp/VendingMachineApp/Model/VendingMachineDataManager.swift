//
//  VendingMachineDataManager.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 11. 16..
//  Copyright © 2018년 Drake. All rights reserved.
//

import Foundation
import UIKit

class VendingMachineDataManager {
    
    private static let vendinMachine_01 = "vendingMachineData_01"
    
    static func saveVendingMachineData(_ vendingMachine: VendingMachine) {
        let vendingMachineData = NSKeyedArchiver.archivedData(withRootObject: vendingMachine)
        UserDefaults.standard.set(vendingMachineData, forKey: vendinMachine_01)
    }
    
    static func loadVendingMachineData() -> VendingMachine? {
        guard let loaded: Data = UserDefaults.standard.data(forKey: vendinMachine_01) else { return nil }
        guard let vendingMachineData = NSKeyedUnarchiver.unarchiveObject(with: loaded) else { return nil }
        guard let vendingMachine = vendingMachineData as? VendingMachine else { return nil }
        return vendingMachine
    }
}
