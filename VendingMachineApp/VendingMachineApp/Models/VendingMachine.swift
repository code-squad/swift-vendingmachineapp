//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct VendingMachine {
    let stock: Stock = Stock()
    private var products: [Beverage] = [
        ChocolateMilk(name: "서울우유-초콜릿", brand: "서울우유", servingSize: 150, price: Money(1000), manufactureDate: Date(), expirationDate: Date(), farmCode: "AEBN127", cacaoContentRate: 23.4),
        BananaMilk(name: "바나나는 원래 하얗다", brand: "매일우유", servingSize: 200, price: Money(1400), manufactureDate: Date(), expirationDate: Date(), farmCode: "DJSN128", bananaContentGram: 30),
        Coke(name: "코카콜라", brand: "코카콜라", servingSize: 140, price: Money(900), manufactureDate: Date(), expirationDate: Date(), isSugarFree: false, packageColor: "RED"),
        Sprite(name: "스프라이트", brand: "코카콜라", servingSize: 250, price: Money(2000), manufactureDate: Date(), expirationDate: Date(), isSugarFree: false, packageMaterial: "Aluminum"),
        Georgia(name: "죠지아", brand: "죠지아", servingSize: 120, price: Money(900), manufactureDate: Date(), expirationDate: Date(), servingCaffeine: 80, isHotCoffee: false)
    ]
    private var purchased: [Beverage] = []
    private(set) var balance: Money = Money()
    
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
        guard balance >= beverage.price && stock.numberOf(beverage) > 0 else { return }
        balance.subtract(money: beverage.price)
        stock.dequeue(beverage: beverage, in: 0)
        purchased.append(beverage)
    }
}
