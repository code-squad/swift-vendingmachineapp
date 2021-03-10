//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    private var stock: StockManageable
    private var purchasehistory: [Drink]
    private var coins: CoinManageable
    
    override init() {
        self.purchasehistory = [Drink]()
        self.stock = Stock()
        self.coins = CoinCounter()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.stock, forKey: "stock")
        coder.encode(self.purchasehistory, forKey: "purchasehistory")
        coder.encode(self.coins, forKey: "coins")
    }
    
    required init?(coder: NSCoder) {
        self.stock = coder.decodeObject(forKey: "stock") as! StockManageable
        self.purchasehistory = coder.decodeObject(forKey: "purchasehistory") as! [Drink]
        self.coins = coder.decodeObject(forKey: "coins") as! CoinManageable
    }
    
    public func addDrink(_ drink: Drink) {
        stock.addedDrink(drink)
        VendingMachineDataCenter.save(to: self)
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
