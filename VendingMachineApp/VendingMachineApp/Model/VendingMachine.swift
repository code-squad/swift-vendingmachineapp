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

class VendingMachine: VendingMachineProtocol, CustomStringConvertible, Codable {
    private var coins: Int
    private var inventory: Inventory
    private var salesHistory: Products

    private static var instance: VendingMachine?

    enum Mode {
        case admin
        case user
        case none
    }

    private init() {
        coins = 0
        inventory = [:]
        salesHistory = []
    }

    static func load(vendingMachine: VendingMachine?) {
        instance = vendingMachine
    }

    static func sharedInstance() -> VendingMachine {
        if instance == nil {
            instance = VendingMachine()
        }
        return instance!
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

    func addProduct(category: Category, product: Beverage) {
        if inventory[category] != nil {
            inventory[category]?.append(product)
        } else {
            inventory[category] = [product]
        }
        NotificationCenter.default.post(name: .beverageCounts, object: self, userInfo: ["inventory": inventory])
    }

    func insertCoins(_ amount: Int) {
        coins += amount
        NotificationCenter.default.post(name: .coins, object: self, userInfo: ["coins": coins])
    }

    func remove(category: Category, index: Int) {
        inventory[category]?.remove(at: index)
    }

    func buy(category: Category) {
        salesHistory.append(inventory[category]!.removeFirst())
        coins -= salesHistory.last!.price
        NotificationCenter.default.post(name: .beverageCounts, object: self, userInfo: ["inventory": inventory])
        NotificationCenter.default.post(name: .coins, object: self, userInfo: ["coins": coins])
    }

}
