//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var stock: StockFactory
    private var coin: Int
    private var purchasehistory: [Drink]
    
    init(stock: StockFactory) {
        self.stock = stock
        self.coin = 0
        self.purchasehistory = [Drink]()
    }

    public func addDrink(_ drink: Drink) {
        stock.addDrink(drink)
    }

    public func insertCoin(_ coin: Int) {
        self.coin += coin
    }
    
    public func availableDrink() -> [Drink] {
        return stock.availableDrink(coin: self.coin)
    }

    public func buy(_ drink: Drink) -> Drink? {
        return stock.buy(drink) { (drink) -> Drink? in
            if self.coin < drink.price { return nil }
            self.purchasehistory.append(drink)
            self.coin -= drink.price
            return drink
        }
    }

    public func leftCoin() -> Int {
        return self.coin
    }
    
    public func showStock() -> [Drink: UInt] {
        return stock.showStock()
    }

    public func findExpiredDrinks() -> [Drink] {
        return stock.findExpiredDrinks()
    }
    
    public func findWarmDrinks() -> [Drink] {
        return stock.findWarmDrinks()
    }
    
    public func showPurchasehistory() -> [Drink] {
        return purchasehistory
    }
}
