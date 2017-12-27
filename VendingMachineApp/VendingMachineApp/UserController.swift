//
//  BeverageBox.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation
// swiftlint:disable class_delegate_protocol
protocol UserDelegate {
    func getBalance() -> Int
    func getStockList() -> [Beverage: Int]
}

struct UserController {
    private var machine: UserVendingMachine
    init(with vendingMachineData: VendingMachineData) {
        self.machine = UserVendingMachine(with: vendingMachineData)
    }
    /*
    mutating func executeMachine() throws {
        let condition = true
        let outputView = OutputView()
        outputView.printMainMenu(machine: machine)
        while condition {
            do {
                try separateVendingMachineExecution(selector: try InputView.readUserMenu(), view: outputView)
            } catch ErrorCode.endCode {
                AdminOutputView.printError(ErrorCode.endCode.description)
            } catch let Error as ErrorCode {
                AdminOutputView.printError(Error.description)
            }
        }
    }
    
    private mutating func separateVendingMachineExecution(selector: [Int], view: OutputView) throws {
        guard selector.count > 1 else {
            throw ErrorCode.validInputString
        }
        switch selector[0] {
        case MenuSelectorUser.insertMode.rawValue:
            machine.insertMoney(selector[1])
            view.printAfterInsertMoney(machine: machine)
        case MenuSelectorUser.purchaseMode.rawValue:
            let beverage = try machine.buyBeverage(number: selector[1])
            view.printAfterBuyingBeverage(beverage: beverage)
            view.printAfterInsertMoney(machine: machine)
        default:
            throw ErrorCode.invalidMenu
        }
    }
    */
}
