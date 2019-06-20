//
//  VendingMachineArchiver.swift
//  VendingMachineApp
//
//  Created by Elena on 20/06/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import Foundation

class VendingMachineArchiver {
    
    // MARK: - enum
    enum loadError: Error {
        case noData
        case noLoad
    }
    
    // MARK: - static func
    static func archive() {
        let vendingMachineEncoded = try? NSKeyedArchiver.archivedData(
            withRootObject: VendingMachine.shared,
            requiringSecureCoding: false)
        UserDefaults.standard.set(vendingMachineEncoded, forKey:"vendingMachine")
    }
    
    static func load() {
        if let data = UserDefaults.standard.data(forKey: "vendingMachine") {
            let vendingMachine = try? NSKeyedUnarchiver
                .unarchiveTopLevelObjectWithData(data)
            guard let machine = vendingMachine as? VendingMachine else { return }
            VendingMachine.shared.set(instance: machine)
        }
    }
    
}
