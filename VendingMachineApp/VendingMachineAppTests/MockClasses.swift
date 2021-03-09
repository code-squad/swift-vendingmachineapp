//
//  MockClasses.swift
//  VendingMachineAppTests
//
//  Created by Song on 2021/03/09.
//

import Foundation

class SinRamen: Shopable {
    func isPurchashable(with money: Int) -> Bool {
        return money >= 2000
    }
    
    func subtractPrice(from balance: Int) -> Int {
        return balance - 2000
    }
}

class SinRamenBlack: Shopable {
    func isPurchashable(with money: Int) -> Bool {
        return money >= 3000
    }
    
    func subtractPrice(from balance: Int) -> Int {
        return balance - 3000
    }
}

class RamenStorage: Storage {
    
    private var stockList: [ObjectIdentifier: [Shopable]]
    
    init(item: Shopable) {
        self.stockList = [ObjectIdentifier(type(of: item)): [item]]
    }
    
    func add(_ item: Shopable) {
        if stockList[ObjectIdentifier(type(of: item))] != nil {
            stockList[ObjectIdentifier(type(of: item))]?.append(item)
        } else {
            stockList[ObjectIdentifier(type(of: item))] = [item]
        }
    }
    
    func pullOut(_ itemType: Shopable.Type) -> Shopable? {
        return stockList[ObjectIdentifier(itemType)]?[0] ?? nil
    }
    
    func listTypeOnly() -> [ObjectIdentifier] {
        return Array(stockList.keys)
    }
    
    func listTypeOnly(filter: (([ObjectIdentifier : [Shopable]]) -> [ObjectIdentifier])) -> [ObjectIdentifier] {
        return filter(stockList)
    }
    
    func listTypeCount() -> [ObjectIdentifier : Int] {
        return [:]
    }
    
    func listTypeCount(filter: (([ObjectIdentifier : [Shopable]]) -> [ObjectIdentifier : Int])) -> [ObjectIdentifier : Int] {
        return [:]
    }
}

class RamenList: OrderableList {
    func push(item: Shopable) {
        
    }
    
    func listByOrder() -> [Shopable] {
        return []
    }
}

class MoneyBox: MoneyManagable {
    
    private var money: Int
    
    init() {
        money = 0
    }
    
    func update(amount: Int) {
        money = amount
    }
    
    func update(to money: Int) {
        self.money = money
    }
    
    func balance() -> Int {
        return money
    }
    
    func affordables(fromItemsIn storage: Storage) -> [ObjectIdentifier] {
        return storage.listTypeOnly(filter: affordable(_:))
    }
    
    private func affordable(_ beverages: [ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier] {
        var purchashableList = [ObjectIdentifier]()
        
        beverages.forEach { (id, list) in
            if list[0].isPurchashable(with: money){
                purchashableList.append(id)
            }
        }
        return purchashableList
    }
}

class RamenManager: FoodManagable {
    func hotItems(fromItemsIn storage: Storage) -> [ObjectIdentifier] {
        return []
    }
    
    func transportables(fromItemsIn storage: Storage) -> [ObjectIdentifier] {
        return []
    }
    
    func healthyItems(fromItemsIn storage: Storage) -> [ObjectIdentifier] {
        return []
    }
    
    func expiredItems(fromItemsIn storage: Storage) -> [ObjectIdentifier : Int] {
        return [:]
    }
}
