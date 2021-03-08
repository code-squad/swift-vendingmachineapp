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
    
    init() {
        self.purchasehistory = [Drink]()
        self.stock = Stock()
        self.coins = CoinCounter()
    }

    public func addDrink(_ drinkType: Drink.Type) {
        guard let productizationType = drinkType as? Productization.Type else { return }
        guard let drink = DrinkFactory.makeDrink(of: productizationType) else { return }
        stock.addedDrink(drink)
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
    
    public func buy(typeOf drinkType: Drink.Type) -> Drink? {
        var haveCoin = 0
        coins.CheckCoins { (coin) in
            haveCoin = coin
        }
        guard let drink = stock.purchased(drinkType: drinkType, insertedCoin: haveCoin) else { return nil }
        self.purchasehistory.append(drink)
        self.coins.expended(to: haveCoin)
        return drink
    }

    public func leftCoin() -> Int {
        var leftCoins = 0
        coins.CheckCoins { (coin) in
            leftCoins = coin
        }
        return leftCoins
    }
    
    public func showStock() -> [ObjectIdentifier: [Drink]] {
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
