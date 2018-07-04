//
//  VendingMachineDataManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 2..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation
import UIKit

class VendingMachineDataManager {
    
    private static let dataKey = "mason"
    
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
