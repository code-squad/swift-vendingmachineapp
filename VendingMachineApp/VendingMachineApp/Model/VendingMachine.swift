//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

typealias Products = [Beverage]
typealias Category = String
typealias Inventory = [Category: Products]

class VendingMachine: VendingMachineProtocol, CustomStringConvertible {
    private var coins: Int
    private var inventory: Inventory
    private var salesHistory: Products = []

    enum Mode {
        case admin
        case user
        case none
    }

    init() {
        coins = 0
        inventory = [:]
    }

    init(coins: Int, inventory: Inventory) {
        self.coins = coins
        self.inventory = inventory
    }

    var description: String {
        return "coins: \(String(coins))원, inventory: \(String(describing: inventory))"
    }

    func getMode(input: String) -> Mode {
        if input == "1" {
            return Mode.admin
        } else if input == "2" {
            return Mode.user
        } else {
            return Mode.none
        }
    }

    func getBalance() -> Int {
        return coins
    }

    func getInventory() -> Inventory {
        return inventory.filter { $0.value.count > 0 }
    }

    func getSalesHistory() -> Products {
        return salesHistory
    }

    func addInventory(category: Category, product: Beverage) {
        inventory[category] = [product]
    }

    func insertCoins(_ amount: Int) {
        coins += amount
    }

    func remove(category: Category, index: Int) {
        inventory[category]?.remove(at: index)
    }

    func buy(category: Category) {
        salesHistory.append(inventory[category]!.removeFirst())
        coins -= salesHistory.last!.price
    }

}
