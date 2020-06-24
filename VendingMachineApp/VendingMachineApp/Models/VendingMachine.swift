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
    private var stock: Stockable
    private var balance: Moneyable
    
    init(stock: Stockable, balance: Moneyable) {
        self.stock = stock
        self.balance = balance
    }
    
    func receive(insertedMoney: Money) {
        balance.plus(money: insertedMoney)
    }
    
    func currentMoney() -> Int {
        return balance.currentMoney()
    }
    
    func addToStock(beverage: Beverage) {
        stock.add(beverage: beverage)
    }
    
    @discardableResult
    func sell(wantedBeverage: Beverage) -> Result<Beverage,SellError> {
        guard balance.isMoreThan(money: Money(balance: wantedBeverage.price))
            else {
                return .failure(.insufficientMoneyError)
        }
        guard stock.subtract(beverage: wantedBeverage)            else {
            return .failure(.nonExistentBeverageError)
        }
        
        stock.logSaled(beverage: wantedBeverage)
        balance.subtract(price: Money(balance: wantedBeverage.price))
        return .success(wantedBeverage)
    }
    
}

extension VendingMachine {
    func repeatSalesLog(handler: (Beverage) -> (Void)) {
        stock.repeatSalesLog { handler($0) }
    }
    
    func repeatHotCoffees(handler: (Coffee) -> (Void)) {
        stock.repeatBeverages { beverage in
            guard let hotCoffee = beverage as? Coffee, hotCoffee.isHot() else { return }
            
            handler(hotCoffee)
        }
    }
    
    func repeatMilksPassed(expirationDate: Date, handler: (Milk) -> (Void)) {
        stock.repeatBeverages { beverage in
            guard let milk = beverage as? Milk,
                !milk.validate(with: expirationDate) else { return }
            
            handler(milk)
        }
    }
    
    func repeatAllBeverages(handler: (Beverage) -> (Void)) {
        stock.repeatBeverages { handler($0) }
    }
}

extension VendingMachine {
    func count(of beverage: Beverage) -> Int {
        var count = 0
        stock.repeatBeverages {
            guard beverage == $0 else { return }
            count += 1
        }
        return count
    }
    
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
            guard balance.isMoreThan(money: Money(balance: $0.price)) else { return }
            
            if sellableBeverages.keys.contains($0) {
                sellableBeverages[$0]? += 1
            } else {
                sellableBeverages[$0] = 1
            }
        }
        return sellableBeverages
    }
}
