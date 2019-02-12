//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

protocol CommonAvailableMachine {
    func markDrinkLabel(_ menu: DrinkCategory, form: (Int) -> Void)
}

protocol UserAvailableMode: CommonAvailableMachine {
    func isAbleToPick(menu: DrinkCategory) -> State
    func pick(menu: DrinkCategory)
    func insert(coin: Int)
    func getCanPurchaseListInsertedCoin() -> [String]
    func markCoinLabel(form: (Int) -> Void)
    func markPurchasedHistory(form: ([Beverage]) -> Void)
}

protocol ManageableMode: CommonAvailableMachine {
    func isAbleToRemove(menu: DrinkCategory) -> State
    func addStock(menu: DrinkCategory)
    func removeDrink(_ menu: DrinkCategory) -> Beverage
    func countPurchased(form: ([Beverage]) -> [String: Int]) -> [String: Int]
}

protocol PrintableMachingState {
    func machineStateInUserMode(form: (Coin, Stock) -> Void)
    func machineStateInManagerMode(form: (Stock) -> Void)
}

class VendingMachine: NSObject, NSCoding {
    static let sharedInstance = VendingMachine()
    
    private var coin: Coin = Coin()
    private var stock: Stock = Stock()
    private var purchaseHistory: PurchaseHistory = PurchaseHistory()
    
    func set(instance: VendingMachine) {
        VendingMachine.sharedInstance.stock = instance.stock
        VendingMachine.sharedInstance.coin = instance.coin
        VendingMachine.sharedInstance.purchaseHistory = instance.purchaseHistory
    }
    
    private override init() {
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.coin, forKey: "coin")
        aCoder.encode(self.stock, forKey: "stock")
        aCoder.encode(self.purchaseHistory, forKey: "purchaseHistory")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.coin = aDecoder.decodeObject(forKey: "coin") as? Coin ?? Coin()
        self.stock = aDecoder.decodeObject(forKey: "stock") as? Stock ?? Stock()
        self.purchaseHistory = aDecoder.decodeObject(forKey: "purchaseHistory") as? PurchaseHistory ?? PurchaseHistory()
    }
    
    private func canBuy(_ price: Int) -> Bool {
        return coin.isEnoughToBuy(of: price)
    }
    
    func searchExpirationList() -> [Beverage] {
        let todayDate: Date = Date()
        return stock.searchExpirationList(to: todayDate)
    }
}

extension VendingMachine: PrintableMachingState {
    func machineStateInUserMode(form: (Coin, Stock) -> Void) {
        form(coin, stock)
    }
    
    func machineStateInManagerMode(form: (Stock) -> Void) {
        form(stock)
    }
}

extension VendingMachine: ManageableMode {
    func isAbleToRemove(menu: DrinkCategory) -> State {
        guard !stock.isEmptyStock(menu) else { return .notEnough }
        return .success
    }
    
    func addStock(menu: DrinkCategory) {
        stock.add(menu.createDrinkByMenu())
        NotificationCenter.default.post(name: .stockChanged, object: nil)
    }
    
    func removeDrink(_ menu: DrinkCategory) -> Beverage {
        return stock.pickOneDrink(menu)
    }

    func countPurchased(form: ([Beverage]) -> [String: Int]) -> [String: Int] {
        return purchaseHistory.accessHistory(form)
    }
}

extension VendingMachine: UserAvailableMode {
    func isAbleToPick(menu: DrinkCategory) -> State {
        guard !stock.isEmptyStock(menu) else { return .notEnough }
        guard canBuy(stock.getPrice(menu)) else { return .fail }
        return .success
    }
    
    func pick(menu: DrinkCategory) {
        let picked = stock.pickOneDrink(menu)
        purchaseHistory.addHistory(of: picked)
        coin.minus(stock.getPrice(menu))
        NotificationCenter.default.post(name: .stockChanged, object: nil)
        NotificationCenter.default.post(name: .coinChanged, object: nil)
        NotificationCenter.default.post(name: .historyChanged, object: nil)
    }
    
    func insert(coin: Int) {
        self.coin.add(coin)
        NotificationCenter.default.post(name: .coinChanged, object: nil)
    }
    
    func getCanPurchaseListInsertedCoin() -> [String] {
        return stock.getPurchaseList(with: coin)
    }
    
    func markCoinLabel(form: (Int) -> Void) {
        coin.get(form: form)
    }
    
    func markPurchasedHistory(form: ([Beverage]) -> Void) {
        purchaseHistory.get(form: form)
    }
}

extension VendingMachine: CommonAvailableMachine {
    func markDrinkLabel(_ menu: DrinkCategory, form: (Int) -> Void) {
        form(stock.eachStockCount(menu.rawValue))
    }
}
