//
//  VendingMachineProtocol.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 15..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

protocol VendingMachineProtocol {

    func getBalance() -> Int
    func getInventory() -> Inventory
    func getSalesHistory() -> Products
    func add(product: Beverage)
    func insertCoins(_ amount: Int)
    func remove(product: Beverage, index: Int)
    func buy(product: Beverage)

}

protocol VendingMachineAdminProtocol {
    func getProductSalesCounts() -> [Beverage: Int]
}
