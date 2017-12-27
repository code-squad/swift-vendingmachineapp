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
    /*
    mutating func executeMachine(spareStock: [Beverage]) throws {
        let condition = true
        while condition {
            do {
                try seperateAdminExecution(with: spareStock)
            } catch ErrorCode.endCode {
                AdminOutputView.printError(ErrorCode.endCode.description)
            }
        }
    }

    private mutating func seperateAdminExecution(with spareStock: [Beverage]) throws {
        switch try InputView.readAdminMenu() {
        case .addstock:
            AdminOutputView.printAddStockList(spareStock)
            addStock(try InputView.readSelectedBeverage(), with: spareStock)
            AdminOutputView.printAddMsg()
        case .removeStock:
            AdminOutputView.printPassedValidateStockList(machine.getPassedValidateBeverage() as! [Beverage])
            try removeStock(try InputView.readSelectedBeverage(), with: machine.getPassedValidateBeverage())
        }
    }
    */
    private mutating func addStock(_ itemNumber: Int, with spareStock: [Beverage]) {
        machine.addBeverage(spareStock[itemNumber - 1])
    }
    private mutating func removeStock(_ itemNumber: Int, with passedStock: [BeverageCheck]) throws {
        try machine.removeBeverage((passedStock[itemNumber - 1] as? Beverage)!)
    }
}
