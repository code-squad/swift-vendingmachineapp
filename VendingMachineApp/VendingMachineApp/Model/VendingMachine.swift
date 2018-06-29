//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class VendingMachine: NSObject {
    private var moneyManager: MoneyManager
    private var stockManager: StockManager
    
    private init(_ moneyManager: MoneyManager, stockManager: StockManager) {
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
    
    func readAllStock() -> [Stock] {
        return self.stockManager.allStock
    }
    
    func readBalance() -> Int {
        return self.moneyManager.readBalance()
    }
    
    func insertMoney(_ price: Int) {
        self.moneyManager.increaseBalance(price)
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
    
    func readStock(_ index: Int) -> Int {
        guard let beverageType = index.beverageType else {
            return 0
        }
        return self.stockManager.readStock(BeverageType(beverageType))
    }
}

extension Int {
    var beverageType: Beverage.Type? {
        switch self {
        case 0:
            return StrawberryMilk.self
        case 1:
            return BananaMilk.self
        case 2:
            return Coke.self
        case 3:
            return TOP.self
        case 4:
            return Sprite.self
        default:
            return nil
        }
    }
}
