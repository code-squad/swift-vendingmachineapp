//
//  VendingMachineDataManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 2..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class VendingMachineDataManager {
    
    static private let encodingKey = "machine"
    static private let saveKey = "savemachine"
    
    static func saveVendingMachineData(_ vendingMachine: VendingMachine) {
        let archiver = NSKeyedArchiver()
        do {
            try archiver.encodeEncodable(vendingMachine, forKey: encodingKey)
            UserDefaults.standard.set(archiver.encodedData, forKey: saveKey)
        } catch {
            fatalError("save data error!!")
        }
    }
    
    static func loadVendingMachineData() -> VendingMachine? {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else {
            return nil
        }
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        return unarchiver.decodeDecodable(VendingMachine.self, forKey: encodingKey)
    }
}
