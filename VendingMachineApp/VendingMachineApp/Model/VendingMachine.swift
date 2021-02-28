//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var stock: StockManagement
    private var coin: Int
    private var purchasehistory: [Drink]
    
    init(stock: StockManagement) {
        self.stock = stock
        self.coin = 0
        self.purchasehistory = [Drink]()
    }

    public func addDrink(_ drink: Drink) {
        stock.addedDrink(drink)
    }

    public func insertCoin(_ coin: Int) {
        self.coin += coin
    }
    
    public func availableDrink() -> [Drink] {
        return stock.availableForDrinks(coin: self.coin)
    }

    public func buy(_ drink: Drink) -> Drink? {
        return stock.purchased(drink) { (drink) -> Drink? in
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
        return stock.toShowStock()
    }

    public func findExpiredDrinks() -> [Drink] {
        return stock.lookingForExpiredDrinks()
    }
    
    public func findWarmDrinks() -> [Drink] {
        return stock.lookingForWarmDrinks()
    }
    
    public func showPurchasehistory() -> [Drink] {
        return purchasehistory
    }
}
