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
    
    private(set) static var `default`: VendingMachine = VendingMachine()
    
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
    
    public static func loadInstance(of vendingMachine: VendingMachine) {
        self.default = vendingMachine
    }
    
    public func addDrink(_ drink: Drink) {
        stock.addedDrink(drink)
    }
    
    public func insertCoin(_ coin: Int) {
        self.coins.inserted(coin)
    }
    
    public func availableDrink() -> [Drink] {
        var drinks = [Drink]()
        coins.checked { (coin) in
            drinks = stock.availableForDrinks(coin: coin)
        }
        return drinks
    }
    
    public func buy(typeOf drinkType: Drink.Type) -> Drink? {
        return coins.used { (coin) -> Drink? in
            guard let drink = stock.purchased(drinkType: drinkType, insertedCoin: coin) else { return nil }
            self.purchasehistory.append(drink)
            self.coins.expended(to: coin)
            return drink
        }
    }
    
    public func leftCoin() -> Int {
        var leftCoins = 0
        coins.checked { (coin) in
            leftCoins = coin
        }
        return leftCoins
    }
    
    public func showStock() -> [ObjectIdentifier: [Drink]] {
        return stock.showedStock()
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
