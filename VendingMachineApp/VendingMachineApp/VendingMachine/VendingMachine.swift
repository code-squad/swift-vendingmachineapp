//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol CommonMode {
    func count(beverage index: Int) -> Int
}

protocol UserMode: class, CommonMode {
    func willAppear()
    func showBalance(with form: (Int) -> Void)
    func insert(money: Money) -> Bool
    func buy(beverage: BeverageSubCategory) -> Beverage?
}

protocol AdminMode: class, CommonMode {
    func add(beverage: BeverageSubCategory)
    func remove(beverage: Int) -> Beverage?
    func removeExpiredBeverages() -> [Beverage]
    func updateHistory(from updatePoint: Int) -> ArraySlice<Beverage>?
}

class VendingMachine: NSObject {
    static let shared: VendingMachine = vendingMachineLoaded()

    private var balance: Money
    private var inventory: Inventory
    private var history: History

    private init(initialBalance: Money = Money(), initialInventory: Inventory) {
        self.balance = initialBalance
        self.inventory = initialInventory
        self.history = History()
    }

    private convenience override init() {
        let emptyList = [ObjectIdentifier: Pack]()
        let inventory = Inventory(list: emptyList)
        self.init(initialInventory: inventory)
    }

    private static let vendingMachineLoaded = { () -> VendingMachine in
        do {
            return try VendingMachineArchiver.load()
        } catch {
            return VendingMachine()
        }
    }

    func willAppear() {
        balance.willAppear()
        inventory.willAppear()
        history.willAppear()
    }

    /* MARK: NSSecureCoding */
    private struct Default {
        static let balance = Money()
        private static let emptyList = [ObjectIdentifier: Pack]()
        static let inventory = Inventory(list: emptyList)
        static let history = History()
    }

    required init?(coder aDecoder: NSCoder) {
        let balance = aDecoder
            .decodeObject(of: Money.self, forKey: Key.balance) ?? Default.balance
        let inventory = aDecoder
            .decodeObject(of: Inventory.self, forKey: Key.inventory) ?? Default.inventory
        let history = aDecoder
            .decodeObject(of: History.self, forKey: Key.history) ?? Default.history
        self.balance = balance
        self.inventory = inventory
        self.history = history
    }

}

extension VendingMachine: NSSecureCoding {

    private enum Key {
        static let balance = "balance"
        static let inventory = "inventory"
        static let history = "history"
    }

    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: Key.balance)
        aCoder.encode(inventory, forKey: Key.inventory)
        aCoder.encode(history, forKey: Key.history)
    }

}

extension VendingMachine: CommonMode {
    
    func count(beverage index: Int) -> Int {
        let nothing = 0
        guard let type = BeverageSubCategory(rawValue: index)?.type else { return nothing }
        guard let pack = inventory.packOf(type: type) else { return nothing }
        return pack.count
    }
    
}

extension VendingMachine: UserMode {

    func showBalance(with form: (Int) -> Void) {
        balance.show(with: form)
    }

    func insert(money: Money) -> Bool {
        guard money.isPositive() else { return false }
        balance.increased(by: money)
        return true
    }

    func buy(beverage: BeverageSubCategory) -> Beverage? {
        guard let pack = inventory.packOf(type: beverage.type) else { return nil }
        guard balance.isEnoughToBuy(pack: pack) else { return nil }
        guard let purchase = inventory.remove(selected: pack) else { return nil }
        inventory.postChange(of: beverage)
        balance.deductedPrice(of: purchase)
        history.update(purchase: purchase)
        return purchase
    }

}

extension VendingMachine: AdminMode {

    func add(beverage: BeverageSubCategory) {
        let newBeverage = beverage.type.init()
        inventory.add(beverage: newBeverage)
        inventory.postChange(of: beverage)
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

    func updateHistory(from updatePoint: Int) -> ArraySlice<Beverage>? {
        return history.update(from: updatePoint)
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
