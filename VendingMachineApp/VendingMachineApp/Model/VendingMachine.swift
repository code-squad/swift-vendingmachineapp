//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var stock: StockManageable
    private var purchasehistory: [Drink]
    private var coins: CoinManageable
    
    init(stock: StockManageable, coinCounter: CoinCounter) {
        self.stock = stock
        self.purchasehistory = [Drink]()
        self.coins = coinCounter
    }

    public func addDrink(_ drink: Drink) {
        stock.addedDrink(drink)
    }

    public func insertCoin(_ coin: Int) {
        self.coins.inserted(coin)
    }
    
    public func availableDrink() -> [Drink] {
        var drinks = [Drink]()
        coins.CheckCoins { (coin) in
            drinks = stock.availableForDrinks(coin: coin)
        }
        return drinks
    }

    public func buy(_ drink: Drink) -> Drink? {
        return stock.purchased(drink) { (drink) -> Drink? in
            var haveCoin = 0
            coins.CheckCoins { (coin) in
                haveCoin = coin
            }
            guard drink.tryPurchased(coin: haveCoin, handle: { (price) in
                self.purchasehistory.append(drink)
                self.coins.expended(to: price)
            }) else {
                return nil
            }
            return drink
        }
    }

    public func leftCoin() -> Int {
        var leftCoins = 0
        coins.CheckCoins { (coin) in
            leftCoins = coin
        }
        return leftCoins
    }
    
    public func showStock() -> [String: UInt] {
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
