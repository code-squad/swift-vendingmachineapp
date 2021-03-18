//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    private(set) var stock: StockManageable
    private(set) var purchaseHistory: CheckableHistory
    private(set) var coins: CoinManageable
    var purchaseHistoryPublisher: Published<[Drink]>.Publisher {
        return purchaseHistory.historyPublisher
    }
    var coinPublisher: Published<Int>.Publisher {
        return coins.coinPublisher
    }
    
    private(set) static var `default`: VendingMachine = VendingMachine()
    
    private override init() {
        self.purchaseHistory = PurchaseHistory()
        self.stock = Stock()
        self.coins = CoinCounter()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.stock, forKey: "stock")
        coder.encode(self.purchaseHistory, forKey: "purchaseHistory")
        coder.encode(self.coins, forKey: "coins")
    }
    
    required init?(coder: NSCoder) {
        self.stock = coder.decodeObject(forKey: "stock") as? StockManageable ?? Stock()
        self.purchaseHistory = coder.decodeObject(forKey: "purchaseHistory") as? CheckableHistory ?? PurchaseHistory()
        self.coins = coder.decodeObject(forKey: "coins") as? CoinManageable ?? CoinCounter()
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
    
    public func availableDrink() -> Set<Drink> {
        return stock.availableForDrinks(coin: coins.leftCoins)
    }
    
    public func buy(typeOf drinkType: Drink.Type) -> Drink? {
        guard let drink = stock.purchased(drinkType: drinkType, insertedCoin: coins.leftCoins) else { return nil }
        self.purchaseHistory.append(drink)
        self.coins.expended(to: drink.price)
        return drink
    }
    
    public func leftCoin() -> Int {
        return coins.leftCoins
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
    
    public func checkPurchasehistory(handle: (Drink) -> ()) {
        purchaseHistory.checkedPurchaseHistory(handle: handle)
    }
    
    public func checkedLastPurchaseHistory() -> Drink? {
        return purchaseHistory.checkedLastPurchaseHistory()
    }
}
