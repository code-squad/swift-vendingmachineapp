//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol BaseMode {
    func addBeverage(_ product: Beverage)
    func addMoney(_ userMoney: VendingMachine.AvailableMoney)
    func buy(_ product: Beverage)
    func getBalance() -> Int
    func generateCountOfProduct() -> [Int]
    func generateListOfHistory() -> [Beverage]
    func generateProductSelected(_ productNum : Int) -> Beverage
}

protocol AdminMode {
    func addBeverage(_ product: Beverage)
    func generateProductSelected(_ productNum : Int) -> Beverage
    func generateCountOfProduct() -> [Int]
    func generateListOfHistory() -> [Beverage]
    func generateListOfProductName() -> [String]
}

class VendingMachine: NSObject, NSCoding, AdminMode, BaseMode {
    
    private var inventory: Inventory = Inventory([])
    private var balance: Int = 0
    private var historyOfProductsSold: [Beverage] = []
    private var productNumbersAndKinds: [Int: ObjectIdentifier] = [:]
    private static let baseProductsBox = [
        StrawberryMilk(), StrawberryMilk(), StrawberryMilk(),
        BananaMilk(), BananaMilk(), BananaMilk(),
        PepciCoke(), PepciCoke(), PepciCoke(), PepciCoke(), PepciCoke(),
        Fanta(), Fanta(), Fanta(),
        TOPCoffee(), TOPCoffee(), TOPCoffee(),
        Georgia(), Georgia()
    ]
    
    private static var instance : VendingMachine = VendingMachine(baseProductsBox)
    
    static func shared() -> VendingMachine {
        return instance
    }
    
    static func loadInstance(_ machine : VendingMachine) {
        instance = machine
    }
    
    private init(_ productsBox: [Beverage]) {
        super.init()
        for oneProduct in productsBox {
            self.inventory.addBeverage(oneProduct)
        }
        self.updateProductNumbersAndKinds()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(inventory, forKey: "inventory")
        aCoder.encode(balance, forKey: "balance")
        aCoder.encode(historyOfProductsSold, forKey: "historyOfProductsSold")
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        guard let history = aDecoder.decodeObject(forKey: "historyOfProductsSold") as? [Beverage] else { return }
        guard let inventory = aDecoder.decodeObject(forKey: "inventory") as? Inventory else { return }
        self.inventory = inventory
        self.balance = aDecoder.decodeInteger(forKey: "balance")
        self.historyOfProductsSold = history
    }
    
    enum AvailableMoney : Int {
        case oneThousand = 1000
        case fiveThousands = 5000
        case unavailableMoney = 0
    }

    func addBeverage(_ product: Beverage) {
        self.inventory.addBeverage(product)
        NotificationCenter.default.post(name: .didUpdateInventory , object: self)
    }

    func addMoney(_ userMoney: AvailableMoney) {
        self.balance += userMoney.rawValue
        NotificationCenter.default.post(name: .didUpdateBalance, object: self, userInfo : [Keyword.Key.balance.rawValue : balance])
    }

    func generateListOfValidProduct() -> [ObjectIdentifier] {
        return self.inventory.generateListOfValidProduct(self.balance)
    }

    func buy(_ product: Beverage) {
        let soldProduct = self.removeProduct(ObjectIdentifier(type(of: product)))
        guard let product = soldProduct else { return }
        self.historyOfProductsSold.append(product)
        self.balance -= product.price
        NotificationCenter.default.post(name: .didUpdateInventory , object: self)
        NotificationCenter.default.post(name: .didUpdateBalance, object: self, userInfo : [Keyword.Key.balance.rawValue : balance])
        NotificationCenter.default.post(name: .didUpdateListOfPurchase, object: self)
    }

    func getBalance() -> Int {
        return self.balance
    }

    func removeProduct(_ product: ObjectIdentifier) -> Beverage? {
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

    func updateProductNumbersAndKinds() {
        var productNumber = 0
        for oneProduct in self.inventory.productsInNumericalOrder {
            self.productNumbersAndKinds.updateValue(oneProduct, forKey: productNumber)
            productNumber += 1
        }
    }

    func generateBeverageFromProductName(_ productName: ObjectIdentifier) -> Beverage? {
        return self.inventory.generateBeverageFromProductName(productName)
    }

    func generateCountOfProduct() -> [Int] {
        return self.inventory.generateCountOfProduct()
    }
    
    func generateProductSelected(_ productNum : Int) -> Beverage {
        return self.generateBeverageFromProductName(self.inventory.productsInNumericalOrder[productNum]) ?? Beverage()
    }
    
    func generateListOfProductName() -> [String] {
        var productsNames : [String] = []
        for index in 0..<6 {
            productsNames.append(self.generateProductSelected(index).description)
        }
        return productsNames
    }
    
}

