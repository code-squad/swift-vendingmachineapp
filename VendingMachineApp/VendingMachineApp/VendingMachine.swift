//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct VendingMachine: VendingMachineManagerFunction, VendingMachineUserFunction {
    private var balance: Int = 0
    private var products: [String: [Beverage]] = [:]
    private var historyOfPurchase: [Beverage] = []

    mutating func insert(money: Int) {
        self.balance += money
    }

    mutating func add(product: Beverage) {
        if self.products["\(type(of: product))"] == nil {
            self.products["\(type(of: product))"] = []
        }
        self.products["\(type(of: product))"]?.append(product)
    }

    func buyableProductList() -> [String: BeverageInfo] {
        var buyableProducts: [String: BeverageInfo] = [:]
        for (key, products) in self.products {
            guard !products.isEmpty else {continue}
            guard products[0].isBuyable(money: self.balance) else {continue}
            let beverageInfo = { (name: String, price: Int) -> BeverageInfo in
                return BeverageInfo.init(name: name, price: price, beverageCount: products.count)
            }
            buyableProducts[key] = products[0].beverageInfo(makeInfo: beverageInfo)
        }
        return buyableProducts
    }

    mutating func buy(productName: String) -> Beverage? {
        let product = self.products[productName]?.popLast()
        if self.products[productName]?.count == 0 {
            self.products[productName] = nil
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

    mutating func removeExpiredProducts() {
        var newProducts: [String: [Beverage]] = [:]
        for (key, products) in products {
            newProducts[key] = products.filter {$0.isExpiryDateOut()}
        }
        self.products = newProducts
    }
}
