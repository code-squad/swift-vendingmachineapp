//
//  DataSetter.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 18/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

struct DataSetter {
    static func save(vendingMachine: VendingMachine) {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }
    
    static func load() -> VendingMachine? {
        if let data = UserDefaults.standard.data(forKey: "vendingMachine") {
            let vendingMachine = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            return vendingMachine as? VendingMachine
        } else {
            return nil
        }
    }
}
