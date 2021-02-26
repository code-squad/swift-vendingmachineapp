//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import Foundation

class VendingMachine {
    // class 구현
    private(set) var stockDrink: StockDrink
    private var coin: Int
    
    init() {
        self.stockDrink = StockDrink()
        self.coin = 0
    }
    // 1단계 이후 지워질 것
//    public func printStockBeverages() {
//        stockBeverages.forEach { (beverage) in
//            print(beverage)
//        }
//    }
    
    public func addBeverage(_ drink: Drink) {
        stockDrink.add(drink)
    }
    
    public func insertCoin(_ coin: Int) {
        self.coin += coin
    }
    
    public func bargainousBeverage() -> [Drink] {
        var bargainousDrink = Set<Drink>()
        stockDrink.checkBeverage { (drink) in
            bargainousDrink.update(with: drink)
        }
        return Array(bargainousDrink)
    }
    
    public func buy(_ productization: Productization) -> Drink? {
        guard let drink = productization as? Drink else { return nil }
        if self.coin < drink.price { return nil }
        
        self.coin -= drink.price
        return drink
    }
    
    public func leftCoin() -> Int {
        return self.coin
    }
    
    public func showStock() -> [Drink: UInt] {
        var stock = Dictionary<Drink, UInt>()
        
        stockDrink.checkBeverage { (drink) in
            stock[drink, default: 0] += 1
        }
        return stock
    }
    
    
}
