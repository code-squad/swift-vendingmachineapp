//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/04.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

enum Result<T, Error> {
    case success(T)
    case fail(Error)
}

enum InventoryError: Error {
    case insufficientBalance
    case notInStock
}

class Inventory: CustomStringConvertible {
    private var inventory = [Beverage]()
    
    var description: String {
        return inventory.description
    }
    
    func add(_ beverage: Beverage) {
        inventory.append(beverage)
    }
    
    func takeOut(_ beverage: String, balance: Int, block: (Result<Beverage, InventoryError>) -> Void) {
        guard let index = inventory.firstIndex(where: { "\(type(of: $0))" == beverage }) else {
            block(.fail(.notInStock))
            return
        }
        
        if inventory[index].price > balance {
            block(.fail(.insufficientBalance))
            return
        }
        
        block(.success(inventory.remove(at: index)))
    }
    
    func repeatForAllItems(_ block: (Beverage) -> Void) {
        inventory.forEach { block($0) }
    }
    
    func repeatForAvailableItems(with balance: Int, _ block: (Beverage) -> Void) {
        inventory.filter { $0.price <= balance }.forEach { block($0) }
    }
    
    func repeatForInvalidItems(with date: Date, _ block: (Beverage) -> Void) {
        inventory.filter { beverage in
            guard let milk = beverage as? Milk else { return false }
            return !milk.isValid(with: date)
        }.forEach { block($0) }
    }
    
    func repeatForHotItems(threshold: Int, _ block: (Beverage) -> Void) {
        inventory.filter { beverage in
            guard let coffee = beverage as? Coffee else { return false }
            return coffee.isHot(threshold: threshold)
        }.forEach { block($0) }
    }
    
    func briefStock() -> Dictionary<String, Int> {
        let keyValuePairs = zip(inventory.map { "\(type(of: $0))" },
                                (0..<inventory.count).map { _ in 1 })
        return Dictionary().merging(keyValuePairs, uniquingKeysWith: +)
    }
}
