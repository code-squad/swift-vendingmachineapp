//
//  Admin.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 19..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct AdminController {
    private var machine: AdminVendingMachine

    init(with vendingMachineData: VendingMachineData) {
        self.machine = AdminVendingMachine(with: vendingMachineData)
    }
    private mutating func addStock(_ itemNumber: Int, with spareStock: [Beverage]) {
        machine.addBeverage(spareStock[itemNumber - 1])
    }
    private mutating func removeStock(_ itemNumber: Int, with passedStock: [BeverageCheck]) throws {
        try machine.removeBeverage((passedStock[itemNumber - 1] as? Beverage)!)
    }
}
