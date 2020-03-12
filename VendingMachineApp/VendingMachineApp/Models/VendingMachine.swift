//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var products: [Beverage] = [
        ChocolateMilk.produce() as! ChocolateMilk,
        BananaMilk.produce(at: Date(timeIntervalSince1970: 0)) as! BananaMilk,
        Coke.produce(at: Date(timeIntervalSince1970: 0)) as! Coke,
        Sprite.produce(at: Date(timeIntervalSince1970: 0)) as! Sprite,
        Georgia.produce(at: Date(timeIntervalSince1970: 0)) as! Georgia,
    ]
    
    let stock: Stock
    private var purchased: [Beverage]
    private(set) var balance: Money
    
    init() {
        self.stock = Stock()
        self.purchased = []
        self.balance = Money()
    }
    
    @discardableResult mutating func putMoney(_ amount: Int) -> Money {
        let money = Money(amount)
        balance.add(money: money)
        return balance
    }
    
    func addToStock(index: Int) {
        let beverage = products[index]
        stock.enqueue(beverage: beverage, in: index)
    }
    
    func numberOfBeverage(_ beverage: Beverage) -> Int {
        return stock.numberOf(beverage)
    }
    
    func availableBeverages() -> Set<Beverage> {
        var availableBeverages: Set<Beverage> = []
        products.forEach { (product) in
            guard balance > product.price else { return }
            availableBeverages.insert(product)
        }
        return availableBeverages
    }
    
    mutating func select(_ beverage: Beverage) {
        guard beverage.isPurchasable(with: balance) && stock.numberOf(beverage) > 0 else { return }
        balance.subtract(money: beverage.price)
        stock.dequeue(beverage: beverage, in: 0)
        purchased.append(beverage)
    }
}
