//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class VendingMachine: Codable {
    private var moneyManager: MoneyManager
    private var stockManager: StockManager
    private static var sharedVendingMachine = VendingMachine()
    
    private init(_ moneyManager: MoneyManager, _ stockManager: StockManager) {
        self.moneyManager = moneyManager
        self.stockManager = stockManager
    }
    
    private convenience init() {
        self.init(MoneyManager(), StockManager())
    }
    
    class func shared() -> VendingMachine {
        return self.sharedVendingMachine
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
}
