//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import Foundation
import Combine

class VendingMachine: NSObject, NSCoding {
    enum Notification {
        static let DidChangePurchaseHistory = Foundation.Notification.Name("DidChangePurchaseHistory")
    }
    
    private var stock: StockManageable
    @Published private(set) var purchaseHistory: [Drink]
    @Published private(set) var coins: CoinManageable
    
    private(set) static var `default`: VendingMachine = VendingMachine()
    
    private override init() {
        self.purchaseHistory = [Drink]()
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
        self.purchaseHistory = coder.decodeObject(forKey: "purchaseHistory") as? [Drink] ?? [Drink]()
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
        for drink in purchaseHistory {
            handle(drink)
        }
    }
}
