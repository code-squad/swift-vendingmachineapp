//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

protocol CommonAvailableMachine {
    func markDrinkLabel(_ menu: Int, form: (Int) -> Void)
    func markCoinLabel(form: (Int) -> Void)
    func markPurchasedHistory(form: ([Beverage]) -> Void)
}

protocol UserAvailableMode: CommonAvailableMachine {
    func isAbleToPick(menu: Int) -> State
    func pick(menu: Int)
    func insert(coin: Int)
    func getCanPurchaseListInsertedCoin() -> [String]
}

protocol ManageableMode: CommonAvailableMachine {
    func isAbleToAdd(menu: Int) -> State
    func isAbleToRemove(menu: Int) -> State
    func addStock(menu: Int)
    func removeDrink(_ menu: Int) -> Beverage
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
    func isAbleToAdd(menu: Int) -> State {
        guard stock.isExist(menu) else { return .notExist }
        return .success
    }
    
    func isAbleToRemove(menu: Int) -> State {
        guard stock.isExist(menu) else { return .notExist }
        guard !stock.isEmptyStock(menu) else { return .notEnough }
        return .success
    }
    
    func addStock(menu: Int) {
        guard let drink = DrinkCategory(rawValue: menu) else { return }
        stock.add(drink.createDrinkByMenu())
        NotificationCenter.default.post(name: .stockChanged, object: nil)
    }
    
    func removeDrink(_ menu: Int) -> Beverage {
        return stock.pickOneDrink(menu: menu)
    }
}

extension VendingMachine: UserAvailableMode {
    func isAbleToPick(menu: Int) -> State {
        guard stock.isExist(menu) else { return .notExist }
        guard !stock.isEmptyStock(menu) else { return .notEnough }
        guard canBuy(stock.getPrice(menu: menu)) else { return .fail }
        return .success
    }
    
    func pick(menu: Int) {
        let picked = stock.pickOneDrink(menu: menu)
        purchaseHistory.addHistory(of: picked)
        coin.minus(stock.getPrice(menu: menu))
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
}

extension VendingMachine: CommonAvailableMachine {
    func markDrinkLabel(_ menu: Int, form: (Int) -> Void) {
        form(stock.eachStockCount(menu))
    }
    
    func markCoinLabel(form: (Int) -> Void) {
        form(coin.get())
    }
    
    func markPurchasedHistory(form: ([Beverage]) -> Void) {
        form(purchaseHistory.get())
    }
}


