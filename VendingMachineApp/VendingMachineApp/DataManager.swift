//
//  DataManager.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/18.
//

import Foundation

class DataManager {
    static let userDefault = UserDefaults.standard
    
    static func load(forKey: String) -> VendingMachine? {
        guard let data = userDefault.object(forKey: forKey) as? Data,
              let vm = ArchivingManager.unarchive(with: data) as? VendingMachine else {
            return nil
        }
        return vm
    }
    
    static func save<T>(data: T, forKey: String) {
        userDefault.set(data, forKey: forKey)
    }
}
