//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

final class VendingMachine: NSObject, NSSecureCoding {
    
    private var moneyManager: MoneyManager
    private var stockManager: StockManager
    private var historyManager: HistoryManager
    private static var sharedInstance = VendingMachine()
    
    private override init() {
        self.moneyManager = MoneyManager()
        self.stockManager = StockManager()
        self.historyManager = HistoryManager()
        super.init()
    }
    
    class func shared() -> VendingMachine {
        return self.sharedInstance
    }
    
    class func loadState(_ vendingMachine: VendingMachine) {
        sharedInstance = vendingMachine
    }
    
    func readAllStock() -> [Stock] {
        return self.stockManager.allStock
    }
    
    func readBalance() -> Int {
        return self.moneyManager.readBalance()
    }
    
    func insertMoney(_ price: Int) {
        self.moneyManager.increaseBalance(price)
    }
    
    func addBeverage(_ beverage: Beverage) {
        stockManager.addStock(beverage)
    }
    
    func addBeverage(_ beverage: Beverage, _ count: Int) {
        for _ in 0..<count {
            self.addBeverage(beverage)
        }
    }
    
    func readStock(_ index: Int) -> Int {
        guard let menu = Menu.init(rawValue: index) else {
            return 0
        }
        return self.stockManager.readStock(menu.beverageType)
    }
    
    func purchaseBeverage(_ menu: Menu) {
        guard moneyManager.isPurchasable(menu.price) else { return }
        if let purchased: Beverage = self.stockManager.removeStock(menu.beverageType) {
            self.historyManager.addPurchased(purchased)
            self.moneyManager.decreaseBalance(purchased.beveragePrice)
        }
    }
    
    func readHistory() -> [Beverage] {
        return self.historyManager.readPurchased()
    }
    
    // MARK: NSSecureCoding
    private struct NSCoderKeys {
        static let moneyManagerKey = "moneyManager"
        static let stockManagerKey = "stockManager"
        static let historyManagerKey = "historyManager"
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let moneyManager = aDecoder.decodeObject(of: MoneyManager.self, forKey: NSCoderKeys.moneyManagerKey) else {
            return nil
        }
        guard let stockManager = aDecoder.decodeObject(of: StockManager.self, forKey: NSCoderKeys.stockManagerKey) else {
            return nil
        }
        guard let historyManager = aDecoder.decodeObject(of: HistoryManager.self, forKey: NSCoderKeys.historyManagerKey) else {
            return nil
        }
        self.moneyManager = moneyManager
        self.stockManager = stockManager
        self.historyManager = historyManager
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(moneyManager, forKey: NSCoderKeys.moneyManagerKey)
        aCoder.encode(stockManager, forKey: NSCoderKeys.stockManagerKey)
        aCoder.encode(historyManager, forKey: NSCoderKeys.historyManagerKey)
    }
}

extension Notification.Name {
    static let didChangeBalance = Notification.Name("didChangeBalance")
    static let didChangeStock = Notification.Name("didChnageStock")
    static let didChangeHistory = Notification.Name("didChangeHistory")
}
