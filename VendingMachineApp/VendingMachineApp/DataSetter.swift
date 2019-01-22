//
//  DataSetter.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 18/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

struct DataSetter {
    static func save() {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: VendingMachine.sharedInstance, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }
    
    static func load() {
        if let data = UserDefaults.standard.data(forKey: "vendingMachine") {
            let vendingMachine = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            guard let machine = vendingMachine as? VendingMachine else { return }
            VendingMachine.sharedInstance.set(instance: machine)
        }
    }
}
