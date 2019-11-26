//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Printable {
    func showBalance(form: (Money) -> Void)
    func showInventory(form: (Int, String, Int, Int) -> Void)
}

protocol VendingMachineManagerable {
    func addStock(_ product: Sellable)
    func removeStock(_ product: Sellable)
    func fetchProduct(at index: Int) -> Sellable
    func fetchHistory() -> [Sellable]
    func fetchProducts(option: ProductStatus) -> [Sellable]
}

protocol VendingMachineUserable {
    func insert(money: Int) -> Bool
    func purchaseProduct(index: Int) -> Sellable?
}

class VendingMachine {
    private var balance: Money = Money()
    private var history: [Sellable] = []
    private var inventory: Storable
    
    init(inventory: Storable) {
        self.inventory = inventory
    }
}

extension VendingMachine: Printable {
    func showBalance(form: (Money) -> Void) {
        form(balance)
    }
    
    func showInventory(form: (Int, String, Int, Int) -> Void) {
        inventory.showInventory(form: form)
    }
}

extension VendingMachine: VendingMachineManagerable {
    func addStock(_ product: Sellable) {
        inventory.addStock(product)
    }
    
    func removeStock(_ product: Sellable) {
        inventory.removeStock(product)
    }
    
    func fetchProduct(at index: Int) -> Sellable {
        return inventory.fetchProduct(at: index)
    }
    
    func fetchHistory() -> [Sellable] {
        return history
    }

    func fetchProducts(option: ProductStatus) -> [Sellable] {
        return inventory.search(option: option, balance: balance)
    }
}

extension VendingMachine: VendingMachineUserable {
    func insert(money: Int) -> Bool {
        let insertResult = balance.add(money: money)
        
        return insertResult
    }
    
    func purchaseProduct(index: Int) -> Sellable? {
        let purchasableProduct = fetchProducts(option: .purchasable)
        guard let beverage = inventory.takeProduct(at: index) else {
            return nil
        }
        
        if !purchasableProduct.contains(where: { $0.objectID == beverage.objectID }) {
            addStock(beverage)
            
            return nil
        }
        
        balance -= beverage.productPrice
        history.append(beverage)
        
        return beverage
    }
}
