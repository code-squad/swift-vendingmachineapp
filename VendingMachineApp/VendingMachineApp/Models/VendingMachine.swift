//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct VendingMachine {
    
    private var products: Products
    private var coin: Int = 0
    private var bag: [Beverage] = []
    public var balance: Bool {
        coin > 0 ? true : false
    }
    public var ordered: [Beverage] {
        bag
    }
    public var productsCount: Int {
        products.count
    }
    
    public init(products: Products = Products()) {
        self.products = products
    }
    
    private func map(_ handler: (Beverage) -> Beverage?) -> [Beverage] {
        var result: [Beverage] = []
        products.forEach{ beverage, value in
            guard let beverage = handler(beverage) else { return }
            result.append(beverage)
        }
        return result
    }
    
    public mutating func insert(coin: Int) {
        self.coin += coin
    }
    
    public mutating func add(product: Beverage, amount: Int) {
        products.update(value: (products[product] ?? 0) + 1, forkey: product)
    }
    
    public mutating func buy(product: Beverage) {
        guard let value = products[product] else { return }
        bag.append(product)
        products.update(value: value - 1, forkey: product)
        coin = product.balance(payment: coin)
    }
    
    public func costValidProducts() -> [Beverage] {
        map { $0.valid(to: coin) ? $0 : nil }
    }
    
    public func inValidDateProducts(date: Date) -> [Beverage] {
        map { $0.validDate(date) ? nil : $0 }
    }
    
    public func hotProducts() -> [Beverage] {
        map { $0.isHot ? $0 : nil }
    }
}

