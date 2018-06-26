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
    func readStock(_ beverageType: BeverageType) -> Int
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
    
    func readStock(_ index: Int) -> Int {
        guard let beverageType = index.beverageType else {
            return 0
        }
        return self.stockManager.readStock(BeverageType(beverageType))
    }
    
    func readBalance() -> Int {
        return self.moneyManager.readBalance()
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
