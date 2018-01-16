//
//  VendingMachineUser.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 18..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct VendingMachineUser {
    private var vendingMachine: VendingMachineProtocol
    private(set) var purchaseList: Products = []

    init(vendingMachine: VendingMachineProtocol) {
        self.vendingMachine = vendingMachine
    }

    func insertCoins(_ amount: Int) {
        vendingMachine.insertCoins(amount)
    }

    func getBuyableProducts() -> [Beverage] {
        var result: [Beverage] = []
        for (key, value) in vendingMachine.getInventory() {
            let count = value.filter { $0.isBuyable(with: vendingMachine.getBalance()) }.count
            if count > 0 {
                result.append(key)
            }
        }
        return result
    }

    mutating func buy(product: Beverage) {
        if vendingMachine.getInventory()[product] != nil {
            vendingMachine.buy(product: product)
            purchaseList.append(vendingMachine.getSalesHistory().last!)
        }
    }

    func getBalance() -> Int {
        return vendingMachine.getBalance()
    }

    func getInventory() -> Inventory {
        return vendingMachine.getInventory()
    }

    func getHotProducts() -> Products {
        var result: Products = []
        vendingMachine.getInventory().forEach({ _, value in
            result.append(contentsOf: value.flatMap { $0 as? Coffee }
                .filter { $0.isHot() }
                .map { $0 as Beverage })
        })
        return result
    }

}
