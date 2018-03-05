//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol AdminMode {
    mutating func addBeverage(_ product: Beverage)
    mutating func removeProduct(_ product: ObjectIdentifier) -> Beverage?
    mutating func updateProductNumbersAndKinds()
    func generateListOfHistory() -> [Beverage]
    func generateInvalidProducts() -> [Beverage]
    func generateListOfProduct() -> [ObjectIdentifier]
    func generateBeverageFromProductName(_ productNumber: ObjectIdentifier) -> Beverage?
}

protocol UserMode {
    mutating func addMoney(_ userMoney: Int)
    mutating func buy(_ product: Beverage)
    mutating func updateProductNumbersAndKinds()
    func generateInvalidProducts() -> [Beverage]
    func generateListOfValidProduct() -> [ObjectIdentifier]
    func getBalance() -> Int
    func generateBeverageFromProductName(_ productName: ObjectIdentifier) -> Beverage?
}

struct VendingMachine: AdminMode, UserMode {

    private var inventory: Inventory = Inventory([])
    private var balance: Int = 0
    private var historyOfProductsSold: [Beverage] = []
    private var productNumbersAndKinds: [Int: ObjectIdentifier] = [:]

    init(productsBox: [Beverage]) {
        for oneProduct in productsBox {
            self.inventory.addBeverage(oneProduct)
        }
        self.updateProductNumbersAndKinds()
    }

    mutating func addBeverage(_ product: Beverage) {
        self.inventory.addBeverage(product)
    }

    mutating func addMoney(_ userMoney: Int) {
        self.balance += userMoney
    }

    func generateListOfValidProduct() -> [ObjectIdentifier] {
        return self.inventory.generateListOfValidProduct(self.balance)
    }

    mutating func buy(_ product: Beverage) {
        let soldProduct = self.removeProduct(ObjectIdentifier(type(of: product)))
        guard let product = soldProduct else { return }
        self.historyOfProductsSold.append(product)
        self.balance -= product.price
    }

    func getBalance() -> Int {
        return self.balance
    }

    mutating func removeProduct(_ product: ObjectIdentifier) -> Beverage? {
        return self.inventory.removeBeverage(product)
    }

    func generateInvalidProducts() -> [Beverage] {
        return self.inventory.generateInvalidProducts()
    }

    func generateHotProducts() -> [Beverage] {
        return self.inventory.generateHotProducts()
    }

    func generateListOfHistory() -> [Beverage] {
        return self.historyOfProductsSold
    }

    func generateListOfProduct() -> [ObjectIdentifier] {
        return self.inventory.generateListOfProduct()
    }

    mutating func updateProductNumbersAndKinds() {
        var productNumber = 1
        for oneProduct in self.inventory.generateListOfProduct() {
            self.productNumbersAndKinds.updateValue(oneProduct, forKey: productNumber)
            productNumber += 1
        }
    }

    func generateBeverageFromProductName(_ productName: ObjectIdentifier) -> Beverage? {
        return self.inventory.generateBeverageFromProductName(productName)
    }

    func generateCountOfProduct(_ productName: ObjectIdentifier) -> Int {
        return self.inventory.generateCountOfProduct(productName)
    }
    
    func generateProductNamesInNumber() -> [ObjectIdentifier] {
        return [StrawberryMilk.getKind(),BananaMilk.getKind(),PepciCoke.getKind(),
                Fanta.getKind(), TOPCoffee.getKind(), Georgia.getKind()]
    }

}
