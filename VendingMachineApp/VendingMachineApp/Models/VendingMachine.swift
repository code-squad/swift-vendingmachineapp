//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

enum SellError: Error {
    case insufficientMoneyError
    case nonExistentBeverageError
}

final class VendingMachine {
    enum Notification {
        static let balanceDidChange = Foundation.Notification.Name("balanceDidChange")
    }
    
    private var stock: Stockable
    private var cashier: Calculable {
        didSet {
            NotificationCenter.default.post(name: Notification.balanceDidChange, object: self)
        }
    }
    
    init(stock: Stockable) {
        self.stock = stock
        self.cashier = Cashier()
    }
    
    func receive(insertedMoney: Int) {
        cashier.plus(money: insertedMoney)
    }
    
    func currentMoney() -> Int {
        return cashier.currentBalance()
    }
    
    func addToStock(beverage: Beverage) {
        stock.add(beverage: beverage)
    }
    
    @discardableResult
    func sell(wantedBeverage: Beverage) -> Result<Beverage,SellError> {
        guard cashier.isEnoughToBuy(price: wantedBeverage.price)
            else {
                return .failure(.insufficientMoneyError)
        }
        guard stock.subtract(beverage: wantedBeverage)            else {
                return .failure(.nonExistentBeverageError)
        }
        
        stock.logSaled(beverage: wantedBeverage)
        cashier.subtract(price: wantedBeverage.price)
        return .success(wantedBeverage)
    }

}

extension VendingMachine {
    func searchSalesLog(handler: (Beverage) -> (Void)) {
        stock.repeatSalesLog { handler($0) }
    }
    
    func searchHotCoffees(handler: (Coffee) -> (Void)) {
        stock.repeatBeverages { beverage in
            guard let hotCoffee = beverage as? Coffee, hotCoffee.isHot() else { return }
            
            handler(hotCoffee)
        }
    }
    
    func searchMilksPassed(expirationDate: Date, handler: (Milk) -> (Void)) {
        stock.repeatBeverages { beverage in
            guard let passedExpirationDateMilk = beverage as? Milk,
                !passedExpirationDateMilk.validate(with: expirationDate) else { return }
            
            handler(passedExpirationDateMilk)
        }
    }
    
    func searchAllBeverages(handler: (Beverage) -> (Void)) {
        stock.repeatBeverages { handler($0) }
    }
}

extension VendingMachine {
    func stockByKind() -> [Beverage: Int] {
        var stockByKind = [Beverage: Int]()
        stock.repeatBeverages {
            if stockByKind.keys.contains($0) {
                stockByKind[$0]? += 1
            } else {
                stockByKind[$0] = 1
            }
        }
        return stockByKind
    }
    
    func sellableBeverages() -> [Beverage: Int] {
        var sellableBeverages = [Beverage: Int]()
        stock.repeatBeverages {
            guard cashier.isEnoughToBuy(price: $0.price) else { return }
            
            if sellableBeverages.keys.contains($0) {
                sellableBeverages[$0]? += 1
            } else {
               sellableBeverages[$0] = 1
            }
        }
        return sellableBeverages
    }
}
