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
            guard drink.tryPurchased(coin: coin, handle: { (price) in
                self.purchasehistory.append(drink)
                self.coin -= price
            }) else {
                return nil
            }
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
