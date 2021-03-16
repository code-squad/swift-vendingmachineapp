//
//  ArchivingManager.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/12.
//

import Foundation

class ArchivingManager {
    static func archive(with things: VendingMachine) -> Data {
        
        guard let archived = try? NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false) else {
            return Data()
        }
        
        return archived
    }

    static func unarchive() -> VendingMachine? {
        
        let data = UserDefaults.standard.data(forKey: "vendingMachine") ?? Data()
        
        guard let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) else {
            return nil
        }

        return object as? VendingMachine
    }
}
