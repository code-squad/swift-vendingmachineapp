//
//  VendingMachineDataManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 2..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class VendingMachineDataManager {
    
    private static let saveKey = "machine"
    
    static func saveVendingMachineData(_ vendingMachine: VendingMachine) {
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(vendingMachine) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
        return
    }
    
    static func loadVendingMachineData() -> VendingMachine? {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else {
            return nil
        }
        let decoder = PropertyListDecoder()
        return try? decoder.decode(VendingMachine.self, from: data)
    }
}
