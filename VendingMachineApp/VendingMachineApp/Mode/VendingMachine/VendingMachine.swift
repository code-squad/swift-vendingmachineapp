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

// MARK: - enum
enum AvailableMoney: Int, CaseIterable {
    case oneThousand = 0
    case fiveThousands = 1
    
    var value: Int {
        switch self {
        case .oneThousand:
            return 1000
        case .fiveThousands:
            return 5000
        }
    }
}

// MARK: - class VendingMachine
class VendingMachine: NSObject {
    
    // MARK: - static variable
    static let shared: VendingMachine = VendingMachine.init(list: Inventory(list: [ObjectIdentifier: Packages]()))
    
    // MARK: - private variable
    private var money: Money
    private var list: Inventory
    private var history: History
    
    // MARK: - variable
    let beverageTypes = [BananaMilk.self, CantataCoffee.self,
                         CocaCola.self, ChocolateMilk.self, StarbucksCoffee.self]
    
    // MARK: - init
    init(startMoney: Int = 0, list: Inventory) {
        self.money = Money(money: startMoney)
        self.list = list
        self.history = History()
    }

    // MARK: - func
    func viewAppear() {
        history.viewAppear()
        money.viewAppear()
        list.viewAppear()
    }
    
    func set(instance: VendingMachine) {
        VendingMachine.shared.money = instance.money
        VendingMachine.shared.list = instance.list
        VendingMachine.shared.history = instance.history
    }
    
    func buyAvailableHotBeverages() -> [Packages] {
        return list.buyAvailableHotBeverages()
    }

    func hasEqualHistory(with theOther: History) -> Bool {
        return self.history == theOther
    }
    
    func count(beverage: Int) -> Int? {
        guard let pack = list.find(type: beverageTypes[beverage]) else { return nil }
        return pack.count
    }
    
    // MARK: - NSSecureCoding
    enum VendingMachineCodingKey: String, CodingKey{
        case money
        case list
        case history
    }
    
    required init?(coder aDecoder: NSCoder) {
        let money = aDecoder
            .decodeObject(of: Money.self, forKey: VendingMachineCodingKey.money.rawValue) ?? Money()
        let inventory = aDecoder
            .decodeObject(of: Inventory.self, forKey: VendingMachineCodingKey.list.rawValue) ?? Inventory(list: [ObjectIdentifier: Packages]())
        let history = aDecoder
            .decodeObject(of: History.self, forKey: VendingMachineCodingKey.history.rawValue) ?? History()
        self.money = money
        self.list = inventory
        self.history = history
    }
    
}

//MARK: extension VendingMachine: NSSecureCodin
extension VendingMachine: NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(money, forKey: VendingMachineCodingKey.money.rawValue)
        aCoder.encode(list, forKey: VendingMachineCodingKey.list.rawValue)
        aCoder.encode(history, forKey: VendingMachineCodingKey.history.rawValue)
    }
}

// MARK: - Protocol Manager
protocol Manager {
    func add(beverage: Beverage)
    func add(beverage: Int) -> Bool
    func remove(beverage: Int) -> Beverage?
    func removeGoBadBeverages() -> [Beverage]
    func count(beverage: Int) -> Int?
    func updateHistory(data: Int) -> ArraySlice<Beverage>?
}

// MARK: - Extension VendingMachine: Manger
extension VendingMachine: Manager {
    
    func updateHistory(data: Int) -> ArraySlice<Beverage>? {
        return history.update(data: data)
    }

    func add(beverage: Beverage) {
        list.add(beverage: beverage)
        NotificationCenter.default.post(name: .addBeverage, object: self)
    }
    
    func removeGoBadBeverages() -> [Beverage] {
        return list.removeGoBadBeverages()
    }

    func add(beverage: Int) -> Bool {
        guard beverage < beverageTypes.count else { return false }
        let newGoods = beverageTypes[beverage].init()
        list.add(beverage: newGoods)
        NotificationCenter.default.post(name: .addBeverage, object: self)
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
    func buyBeverage(beverage: BeverageTypeName) -> Beverage?
}

// MARK: - Extension VendingMachine: Customer
extension VendingMachine: Customer {

    func isEmpty() -> Bool {
        return list.isEmpty()
    }

    func isPut(cash: Int) -> Bool {
        NotificationCenter.default.post(name: .insertMoney, object: self)
        return money.addMoney(put: cash)        
    }

    func buyAvailableList() -> [Packages] {
        return list.buyAvailableList(money: money)
    }

    func buyBeverage(beverage: BeverageTypeName) -> Beverage? {
        guard let findBeverage = list.find(type: beverage.type)else { return nil}
        guard findBeverage.isBuyable(with: money) else { return nil }
        guard let beverageSelect = list.remove(beverage: findBeverage) else { return nil }
        
        beverageSelect.subtract(pay: money)
        history.add(purchase: beverageSelect)
        list.postDataChanged(index: beverage.rawValue)
        return beverageSelect
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
