//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias BuyableResultPrintClosure = (Bool, Int, String) -> Void
typealias AllListResultPrintClosure = (String, Int, Bool) -> Void

struct VendingMachine {
    private var money: Money
    private var list: Inventory
    private var history: History
    private let beverageTypes = [ChocolateMilk.self, BananaMilk.self, Sprite.self,
                                 CocaCola.self, CantataCoffee.self, StarbucksCoffee.self ]

    init(startMoney: Int = 0, list: Inventory) {
        self.money = Money(money: startMoney)
        self.list = list
        self.history = History()
    }

    func buyAvailableHotBeverages() -> [Packages] {
        return list.buyAvailableHotBeverages()
    }

    func hasEqualHistory(with theOther: History) -> Bool {
        return self.history == theOther
    }

}

// MARK: - Protocol Manager
protocol Manager {
    func add(beverage: Beverage)
    func add(beverage: Int) -> Bool
    func remove(beverage: Int) -> Beverage?
    func removeGoBadBeverages() -> [Beverage]
}

// MARK: - Extension VendingMachine: Manger
extension VendingMachine: Manager {

    func add(beverage: Beverage) {
        list.add(beverage: beverage)
    }

    func removeGoBadBeverages() -> [Beverage] {
        return list.removeGoBadBeverages()
    }

    func add(beverage: Int) -> Bool {
        guard beverage < beverageTypes.count else { return false }
        let newGoods = beverageTypes[beverage].init()
        list.add(beverage: newGoods)
        return true
    }

    func remove(beverage: Int) -> Beverage? {
        guard beverage < beverageTypes.count else { return nil }
        guard let goods = list.find(type: beverageTypes[beverage]) else { return nil }
        guard let beverage = list.remove(beverage: goods) else { return nil }
        return beverage
    }
}

// MARK: - Protocol Customer
protocol Customer {
    func isEmpty() -> Bool
    func isPut(cash: Int) -> Bool
    func buyAvailableList() -> [Packages]
    mutating func buyBeverage(package: Packages) -> Beverage?
}

// MARK: - Extension VendingMachine: Customer
extension VendingMachine: Customer {

    func isEmpty() -> Bool {
        return list.isEmpty()
    }

    func isPut(cash: Int) -> Bool {
        return money.addMoney(put: cash)
    }

    func buyAvailableList() -> [Packages] {
        return list.buyAvailableList(money: money)
    }

    mutating func buyBeverage(package: Packages) -> Beverage? {
        guard let beverage = list.remove(beverage: package) else { return nil }
        beverage.subtract(pay: money)
        history.add(purchase: beverage)
        return beverage
    }

}

// MARK: - Protocol VendingMachineShowCustomer
protocol VendingMachineShowCustomer {
    func showList(show: (Int) -> Void)
    func showListOfAll(list: AllListResultPrintClosure)
    func showListOfBuyable(list: BuyableResultPrintClosure)
}

// MARK: - Extension VendingMachine: VendingMachineShowCustomer
extension VendingMachine: VendingMachineShowCustomer {
    func showList(show: (Int) -> Void) {
        show(money.showMoney())
    }

    func showListOfAll(list show: AllListResultPrintClosure) {
        let lists = list.getListOfAll()
        let listBuyable = buyAvailableList()
        for pack in lists {
            let buyable = listBuyable.contains(pack.key)
            show(pack.key.description, pack.value, buyable)
        }
    }

    func showListOfBuyable(list show: BuyableResultPrintClosure) {
        let listBuyable = buyAvailableList()
        for (index, packBuyable) in listBuyable.enumerated() {
            let number = index + 1
            let last = (number == listBuyable.count)
            show(last, number, packBuyable.description)
        }
    }
}

// MARK: - Protocol VendingMachineShowManager
protocol VendingMachineShowManager {
    func showListOfAllManager(list: AllListResultPrintClosure)
}

// MARK: - Extension VendingMachine: VendingMachineShowManager
extension VendingMachine: VendingMachineShowManager {

    func showListOfAllManager(list show: AllListResultPrintClosure) {
        let aFullList = list.getListOfAll()

        for (number, value) in beverageTypes.enumerated() {
            let number = number + 1
            guard let item = list.find(type: value) else { continue }
            if list.haveNot(beverage: value) {
                show("\(number). \(item.title)", 0, false)
                continue
            }
            guard let count = aFullList[item] else { continue }
            show("\(number). \(item.title)", count, true)
        }
    }
}
