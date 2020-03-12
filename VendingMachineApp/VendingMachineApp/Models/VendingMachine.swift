//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

typealias Standard = (temperature: Double, calorie: Double)

struct VendingMachine {
    
    private var products: Products
    private var money: Money
    private var bag: [Beverage] = []
    private var standard: Standard
    var balance: Int {
        money.balance
    }
    public var ordered: [Beverage] {
        bag
    }
    public var productsCount: Int {
        products.count
    }
    
    public init(
        products: Products = Products(),
        money: Money = Money(),
        standard: Standard
    ) {
        self.products = products
        self.money = money
        self.standard = standard
    }
    
    public mutating func add(product: Beverage, amount: Int) {
        products.update(value: (products[product] ?? 0) + 1, forkey: product)
    }
    
    public mutating func buy(product: Beverage) {
        guard let value = products[product] else { return }
        bag.append(product)
        products.update(value: value - 1, forkey: product)
        money.balance(product.price)
    }
    
    public func costValidProducts() -> [Beverage] {
        products.compactMap { money.valid($0.price) ? $0 : nil }
    }
    
    public func inValidDateProducts(date: Date) -> [Beverage] {
        products.compactMap { $0.validDate(date) ? nil : $0 }
    }
    
    public func hotProducts() -> [Beverage] {
        products.compactMap { $0.isHot(standard.temperature) ? $0 : nil }
    }
}

