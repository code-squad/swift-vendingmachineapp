//
//  Interfaces.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/05.
//

import Foundation

protocol Shopable {
    
    func isPurchashable(with money: Int) -> Bool
    
    func subtractPrice(from balance: Int) -> Int
    
}

protocol Storage {
    
    func add(_ item: Shopable)
    
    func pullOut(_ itemType: Shopable.Type) -> Shopable?
    
    func listTypeOnly() -> [ObjectIdentifier]
    
    func listTypeOnly(filter: (([ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier])) -> [ObjectIdentifier]
    
    func listTypeCount() -> [ObjectIdentifier: Int]
    
    func listTypeCount(filter: (([ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier: Int])) -> [ObjectIdentifier: Int]
    
}

protocol OrderableList {
    
    func push(item: Shopable)
    
    func listByOrder() -> [Shopable]
}

protocol MoneyManagable {
    
    func update(amount: Int)
    
    func update(to money: Int)
    
    func balance() -> Int
    
    func affordables(fromItemsIn storage: Storage) -> [ObjectIdentifier]
}

protocol ProductManagable {
    
    func expiredItems(fromItemsIn storage: Storage) -> [ObjectIdentifier: Int]
    
}

protocol FoodManagable: ProductManagable {
    
    func hotItems(fromItemsIn storage: Storage) -> [ObjectIdentifier]
    
    func transportables(fromItemsIn storage: Storage) -> [ObjectIdentifier]
    
    func healthyItems(fromItemsIn storage: Storage) -> [ObjectIdentifier]
    
}
