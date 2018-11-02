//
//  DataManager.swift
//  VendingMachineApp
//
//  Created by 이동건 on 02/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import Foundation

class DataManager {
    static func load() throws -> VendingMachine {
        guard let data = UserDefaults.standard.object(forKey: "vendingMachine") as? Data else { throw DataManageError.failToLoad}
        guard let vendingMachine = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? VendingMachine else { throw DataManageError.failToLoad }
        return vendingMachine
    }
    
    static func save() throws {
        let data = try NSKeyedArchiver.archivedData(withRootObject: VendingMachine.shared, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }
}
