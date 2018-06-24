//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

protocol StockManagable {
    var allStock: [Stock] { get }
    func addStock(_ beverage: Beverage)
}

protocol MoneyManagable {
    func readBalance() -> Int
    func increaseBalance(_ price: Int)
    func decreaseBalance(_ price: Int)
}

class VendingMachine: NSObject {
    private var moneyManager: MoneyManagable
    private var stockManager: StockManagable
    
    private init(_ moneyManager: MoneyManagable, stockManager: StockManagable) {
        self.moneyManager = moneyManager
        self.stockManager = stockManager
    }
    
    private override convenience init() {
        self.init(MoneyManager(), stockManager: StockManager())
    }
    
    private static let sharedVendingMachine = VendingMachine()
    
    class func shared() -> VendingMachine {
        return self.sharedVendingMachine
    }
    
    func addBeverage(_ beverageType: Beverage.Type) {
        let beverage = BeverageFactory.makeBeverage(beverageType: beverageType)
        stockManager.addStock(beverage)
    }
    
    func addBeverage(_ beverageType: Beverage.Type, _ count: Int) {
        for _ in 0..<count {
            self.addBeverage(beverageType)
        }
    }
    
    func readAllStock() -> [Stock] {
        return self.stockManager.allStock
    }
}
