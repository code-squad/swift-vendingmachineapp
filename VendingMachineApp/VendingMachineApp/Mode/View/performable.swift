//
//  performable.swift
//  VendingMachine
//
//  Created by Elena on 25/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// MARK: - Protocol SelectMode
protocol SelectMode {
    mutating func perform()
}

// MARK: - Struct ManagerMode
struct ManagerMode {

    private var vendingMachine: Manager & VendingMachineShowManager

    init(vendingMachine: Manager & VendingMachineShowManager) {
        self.vendingMachine = vendingMachine
    }

    private func readMenu() throws -> ManagerMenuScript? {
        ManagerOutputView.start(vendingMachine)
        let input = InputView.readInput()
        if Menu.moveHighStep(input: input) { return nil }
        return try Menu.readManagerMenu(input: input)
    }

    private func removeGobadBeverages() {
        let goBadGoods = vendingMachine.removeGoBadBeverages()
        ManagerOutputView.showListRemoved(beverages: goBadGoods)
    }

    private func readValue() throws -> Int {
        let input = InputView.readInput()
        guard let value = Int(input) else { throw MenuError.noNumberGoods }
        return value - 1
    }

    private func select(menu: ManagerMenuScript) -> Bool {
        switch menu {
        case .addBeverage, .removeBeverage:
            ManagerOutputView.question(value: menu)
            return false
        case .removeGoBadBeverages:
            removeGobadBeverages()
        }
        return true
    }

    private func addBeverage(number: Int) throws {
        guard vendingMachine.add(beverage: number) else { throw VendingMachineError.notAddition }
        ManagerOutputView.showAddMsg(beverage: number)
    }

    private func removeBeverage(number: Int) throws {
        guard let beverage = vendingMachine.remove(beverage: number) else { throw VendingMachineError.notAddition }
        ManagerOutputView.showRemoveMsg(beverage: beverage)
    }

}

// MARK: - Struct CustomerMode
struct CustomerMode {
    private var vendingMachine: Customer & VendingMachineShowCustomer

    init(vendingMachine: Customer & VendingMachineShowCustomer) {
        self.vendingMachine = vendingMachine
    }

    private func readMenu() throws -> (details: CustomerMenuScript, value: Int)? {
        if vendingMachine.isEmpty() { throw
            VendingMachineError.beSoldOut
        }
        CustomerOutputView.start(vendingMachine)
        let input = InputView.readInput()
        if Menu.moveHighStep(input: input) { return nil }
        return try Menu.readCustomerMenu(input: input)
    }

    mutating private func insert(money: Int) -> Bool {
        guard vendingMachine.isPut(cash: money) else {
            return false
        }
        CustomerOutputView.showInsertion(money: money)
        return true
    }

    mutating private func purchase(beverage: Int) throws -> Bool {
        let list = vendingMachine.buyAvailableList()
        let number = beverage - 1
        guard number < list.count else { throw MenuError.notMenu }
        let package = list[number]
        guard let beverage = vendingMachine.buyBeverage(package: package) else { return false }
        CustomerOutputView.showPurchase(beverage: beverage)
        return true
    }

}

// MARK: - extension ManagerMode: SelectMode
extension ManagerMode: SelectMode {

    mutating func perform() {
        while true {
            do {
                guard let menu = try readMenu() else { return }
                if select(menu: menu) { continue }
                let value = try readValue()

                switch menu {
                case .addBeverage:
                    try addBeverage(number: value)
                case .removeBeverage:
                    try removeBeverage(number: value)
                default:
                    continue
                }

            } catch let error as MenuError {
                OutputView.showMessage(error: error)
            } catch {
                OutputView.showMessage(error: MenuError.notDefine)
            }
        }
    }

}

// MARK: - extension CustomerMode: SelectMode
extension CustomerMode: SelectMode {

    mutating func perform() {
        while true {
            do {
                guard let menu = try readMenu() else { return }

                switch menu.details {
                case .addMoney:
                    guard insert(money: menu.value) else {
                        continue
                    }
                case .buyBeverage:
                    guard try purchase(beverage: menu.value) else {
                        continue
                    }
                }

            } catch let error as MenuError {
                OutputView.showMessage(error: error)
            } catch {
                OutputView.showMessage(error: MenuError.notDefine)
            }
        }
    }

}
