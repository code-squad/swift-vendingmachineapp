//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol Consumer {
    func isEmpty() -> Bool
    mutating func insert(money: Int) -> Bool
    func getListBuyable() -> [Pack]
    mutating func buy(beverage: Pack) -> Beverage?
}

protocol PrintableForConsumer {
    func showBalance(with: (Int) -> Void)
    func showListOfAllMarked(with: (String, Int, Bool) -> Void)
    func showListOfBuyable(with: (Bool, Int, String) -> Void)
}

protocol Manager {
    func add(beverage: Beverage)
    func add(beverage: BeverageSubCategory) -> Bool
    func remove(beverage: Int) -> Beverage?
    func removeExpiredBeverages() -> [Beverage]
}

protocol PrintableForManager {
    func showListOfAll(with: (String, Int, Bool) -> Void)
    func hasHistory() -> Bool
    func showHistory(with: (Int, String) -> Void)
}

struct VendingMachine {
    private var balance: Int
    private var inventory: Inventory
    private var history: History

    init(beginningBalance: Int = 0, initialInventory: Inventory) {
        self.balance = beginningBalance
        self.inventory = initialInventory
        self.history = History()
    }

    func getListOfHotBeverages() -> [Pack] {
        return inventory.getListOfHotBeverages()
    }

    func hasEqualHistory(with theOther: History) -> Bool {
        return self.history == theOther
    }

    func count(beverage index: Int) -> Int? {
        guard let type = BeverageSubCategory(rawValue: index)?.type else { return nil }
        guard let pack = inventory.packOf(type: type) else { return nil }
        return pack.count
    }

}

extension VendingMachine: Consumer {

    func isEmpty() -> Bool {
        return inventory.isEmpty()
    }

    mutating func insert(money: Int) -> Bool {
        guard money > 0 else { return false }
        balance += money
        return true
    }

    func getListBuyable() -> [Pack] {
        return inventory.getListBuyable(with: balance)
    }

    mutating func buy(beverage pack: Pack) -> Beverage? {
        guard let beverage = inventory.remove(selected: pack) else { return nil }
        balance = beverage.subtractPrice(from: balance)
        history.update(purchase: beverage)
        return beverage
    }

}

extension VendingMachine: PrintableForConsumer {

    func showBalance(with show: (Int) -> Void) {
        show(balance)
    }

    func showListOfBuyable(with show: (Bool, Int, String) -> Void) {
        let listBuyable = getListBuyable()
        for (index, packBuyable) in listBuyable.enumerated() {
            let number = index + 1
            let last = (number == listBuyable.count)
            show(last, number, packBuyable.description)
        }
    }

    func showListOfAllMarked(with show: (String, Int, Bool) -> Void) {
        let list = inventory.getListOfAll()
        let listBuyable = getListBuyable()
        for pack in list {
            let buyable = listBuyable.contains(pack.key)
            show(pack.key.description, pack.value, buyable)
        }
    }

}

extension VendingMachine: Manager {

    func add(beverage: Beverage) {
        inventory.add(beverage: beverage)
    }

    func add(beverage: BeverageSubCategory) -> Bool {
        let newBeverage = beverage.type.init()
        inventory.add(beverage: newBeverage)
        return true
    }

    func remove(beverage number: Int) -> Beverage? {
        guard let type = BeverageSubCategory(rawValue: number)?.type else { return nil }
        guard let pack = inventory.packOf(type: type) else { return nil }
        guard let beverage = inventory.remove(selected: pack) else { return nil }
        return beverage
    }

    func removeExpiredBeverages() -> [Beverage] {
        return inventory.removeExpiredBeverages()
    }

}

extension VendingMachine: PrintableForManager {

    func hasHistory() -> Bool {
        return !history.isEmpty()
    }

    func showHistory(with show: (Int, String) -> Void) {
        history.showList(with: show)
    }

    func showListOfAll(with show: (String, Int, Bool) -> Void) {
        let list = inventory.getListOfAll()
        for beverage in BeverageSubCategory.allCases {
            let type = beverage.type
            guard let pack = inventory.packOf(type: type) else { continue }
            if inventory.hasNoBeverage(of: type) {
                show("\(pack.title)", 0, false)
                continue
            }
            guard let quantity = list[pack] else { continue }
            show("\(pack.title)", quantity, true)
        }
    }

}

enum VendingMachineError: Error {
    case outOfStock
    case notExistPack
    case cannotRemove

    var message: String {
        switch self {
        case .outOfStock:
            return "⚠️ 죄송합니다. 모든 품목이 품절되었습니다. ⚠️\n   익일 재고 보충 예정입니다. 감사합니다."
        case .notExistPack:
            return "추가된 적이 없는 음료종류입니다."
        case .cannotRemove:
            return "더 이상 재고가 없습니다."
        }
    }
}
