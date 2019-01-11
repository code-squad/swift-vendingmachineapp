//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    
    //MARK: - encode, decode
    func encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: VendingMachineArchiveKey.balance)
        aCoder.encode(products, forKey: VendingMachineArchiveKey.products)
        aCoder.encode(historyOfPurchase, forKey: VendingMachineArchiveKey.historyOfPurchase)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        balance = aDecoder.decodeInteger(forKey: VendingMachineArchiveKey.balance)
        products = aDecoder.decodeObject(forKey: VendingMachineArchiveKey.products) as! [Int: [Beverage]]
        historyOfPurchase = aDecoder.decodeObject(forKey: VendingMachineArchiveKey.historyOfPurchase) as! [Beverage]
    }
    
    //MARK: - Properties
    private var balance: Balance = Balance()
    private var products: Products = Products()
    private var historyOfPurchase: HistoryOfPurchase = HistoryOfPurchase()

    //MARK: - Methods
    //MARK: Balance
    func insert(money: Money) {
        self.balance.insert(money: money)
    }

    //MARK: Products
    func add<T>(product: T) where T: Beverage, T: Product {
        let tag = Mapper.mapping(product: product)
        if self.products[tag] == nil {
            self.products[tag] = []
        }
        self.products[tag]?.append(product)
    }

    func buy(tag: Int) -> Beverage? {
        let product = self.products[tag]?.popLast()
        if self.products[tag]?.count == 0 {
            self.products[tag] = nil
        }
        if let product = product {
            self.historyOfPurchase.append(product)
            self.balance = pay(product: product)
        }
        return product
    }

    private func pay(product: Beverage) -> Int {
        let pay: (Int) -> Int = { (price: Int) -> Int in
            return self.balance - price
        }
        return product.pay(pay: pay)
    }

    func readBalance() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: self.balance as NSNumber) ?? ""
    }

    func inventory() -> [String: Int] {
        var inventoryStatus: [String: Int] = [:]

        for (_, products) in self.products {
            guard !products.isEmpty else {continue}
            let name = { (name: String) -> String in
                return name
            }
            let beverageName = products[0].name(read: name)
            inventoryStatus[beverageName] = products.count
        }

        return inventoryStatus
    }
    
    func number(of tag: Int) -> Int {
        return products[tag]?.count ?? 0
    }

    func expiredProducts() -> [Beverage] {
        var expiredProducts: [Beverage] = []

        for (_, products) in self.products {
            expiredProducts.append(contentsOf: products.filter {$0.isExpiryDateOut()})
        }

        return expiredProducts
    }

    func hotProducts() -> [String] {
        var hotProducts: [String] = []

        for (_, products) in self.products {
            guard !products.isEmpty else {continue}
            guard let variousTemperaturesBeverage = products[0] as? VariousTemperatures else {continue}
            guard variousTemperaturesBeverage.isHot else {continue}
            hotProducts.append(products[0].name { (name: String) -> String in
                return name
            })
        }
        return hotProducts
    }
    
    //MARK: - Get Properties Method
    func property(of vendingMachine: VendingMachine) {
        self.balance = vendingMachine.balance
        self.products = vendingMachine.products
        self.historyOfPurchase = vendingMachine.historyOfPurchase
    }
}
