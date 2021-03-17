//
//  DataManager.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/17.
//

import Foundation

class DataManager {

    class func load() -> VendingMachine? {
        if UserDefaults.standard.object(forKey: String(describing: VendingMachine.self)) != nil {
            
            guard let encodedData = UserDefaults.standard.data(forKey: String(describing: VendingMachine.self)) else { return nil }
            guard let archivedMachine = NSKeyedUnarchiver.unarchiveObject(with: encodedData) as? VendingMachine else { return nil }
            return archivedMachine
        }
        return nil
    }

    class func save(data: VendingMachine) {
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: data), forKey: String(describing: VendingMachine.self))
    }
}
