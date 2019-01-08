//
//  File.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 08/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import Foundation

struct VendingMachineArchiver {

    enum ArchivingError: Error {
        case noData
        case notLoaded
    }

    static func archive(vendingMachine: VendingMachine?) {
        guard let vendingMachine = vendingMachine else { return }
        let vendingMachineEncoded = try? NSKeyedArchiver.archivedData(
            withRootObject: vendingMachine,
            requiringSecureCoding: false)
        UserDefaults.standard.set(vendingMachineEncoded, forKey:"vendingMachine")
    }

    static func load() throws -> VendingMachine {
        guard let data = UserDefaults.standard.data(forKey: "vendingMachine") else { throw ArchivingError.noData }
        guard let vendingMachine = try NSKeyedUnarchiver
            .unarchiveTopLevelObjectWithData(data) as? VendingMachine else { throw ArchivingError.notLoaded }
        return vendingMachine
    }

    static func setDefault() -> VendingMachine {
        let money = Money()
        let inventory = Inventory(list: [ObjectIdentifier: Pack]())
        return VendingMachine.init(initialBalance: money, initialInventory: inventory)
    }

}
