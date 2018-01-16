//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

typealias Products = [Beverage]
typealias Inventory = [Beverage: Products]

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

    func add(product: Beverage) {
        if inventory[product] != nil {
            inventory[product]?.append(product)
        } else {
            inventory[product] = [product]
        }
        NotificationCenter.default.post(name: .beverageCounts, object: self,
                                        userInfo: [Keyword.Key.product.value: product,
                                                   Keyword.Key.productCount.value: inventory[product]?.count ?? 0])
    }

    func insertCoins(_ amount: Int) {
        coins += amount
        NotificationCenter.default.post(name: .coins, object: self, userInfo: [Keyword.Key.coins.value: coins])
    }

    func remove(product: Beverage, index: Int) {
        inventory[product]?.remove(at: index)
    }

    func buy(product: Beverage) {
        salesHistory.append(inventory[product]!.removeFirst())
        coins -= salesHistory.last!.price
        NotificationCenter.default.post(name: .beverageCounts, object: self,
                                        userInfo: [Keyword.Key.product.value: product,
                                                   Keyword.Key.productCount.value: inventory[product]?.count ?? 0])
        NotificationCenter.default.post(name: .coins, object: self, userInfo: [Keyword.Key.coins.value: coins])
        NotificationCenter.default.post(name: .purchase, object: self,
                                        userInfo: [Keyword.Key.image.value: salesHistory.last!.image,
                                                   Keyword.Key.purchaseListCount.value: salesHistory.count])
    }

}
