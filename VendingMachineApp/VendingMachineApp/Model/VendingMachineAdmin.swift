//
//  VendingMachineAdmin.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 18..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct VendingMachineAdmin: VendingMachineAdminProtocol {
    private var vendingMachine: VendingMachineProtocol

    init(vendingMachine: VendingMachineProtocol) {
        self.vendingMachine = vendingMachine
    }

    mutating func add(product: Beverage) {
        vendingMachine.add(product: product)
    }

    func getExpiredProducts(date: Date) -> Products {
        var result: Products = []
        vendingMachine.getInventory().forEach({ _, value in
            result.append(contentsOf: value.flatMap { $0 as? Milk }
                .filter { !$0.validate(with: date) }
                .map { $0 as Beverage })
        })
        print("check::: \(result)")
        return result
    }

    func getSalesHistory() -> Products {
        return vendingMachine.getSalesHistory()
    }

    func getProductSalesCounts() -> [Beverage: Int] {
        var productCounts: [Beverage: Int] = [:]
        for beverage in getSalesHistory() {
            if productCounts[beverage] == nil {
                productCounts[beverage] = 0
            }
            productCounts[beverage]! += 1
        }
        return productCounts
    }

    func getInventory() -> Inventory {
        return vendingMachine.getInventory()
    }

    func remove(product: Beverage) {
        if let inventory = vendingMachine.getInventory()[product] {
            for i in 0..<inventory.count where inventory[i] == product {
                vendingMachine.remove(product: product, index: i)
            }
        }
    }

}
