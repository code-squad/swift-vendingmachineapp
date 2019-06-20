//
//  VMArchiver.swift
//  VendingMachineApp
//
//  Created by Elena on 20/06/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import Foundation

class VMArchiver {
    
    // MARK: - enum
    enum loadError: Error {
        case noData
        case noLoad
    }
    
    // MARK: - static func
    static func archive() {
        let vendingMachine = VendingMachine.shared
        
        let vendingMachineEncoded = try? NSKeyedArchiver.archivedData(
            withRootObject: vendingMachine,
            requiringSecureCoding: false)
        UserDefaults.standard.set(vendingMachineEncoded, forKey:"vendingMachine")
        
    }
    
    static func load() throws -> VendingMachine {
        guard let data = UserDefaults.standard.data(forKey: "vendingMachine") else { throw loadError.noData }
        guard let vendingMachine = try NSKeyedUnarchiver
            .unarchiveTopLevelObjectWithData(data) as? VendingMachine else { throw loadError.noLoad }
        return vendingMachine
    }
    
    static func set() -> VendingMachine {
        return VendingMachine.init(list: Inventory(list: [ObjectIdentifier: Packages]()))
    }
    
}
