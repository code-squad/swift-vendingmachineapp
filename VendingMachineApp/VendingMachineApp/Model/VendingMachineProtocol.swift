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
    func addProduct(category: Category, product: Beverage)
    func insertCoins(_ amount: Int)
    func remove(category: Category, index: Int)
    func buy(category: Category)

}
