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
    private var stockable: Stockable
    private var calculable: Calculable
    
    init(stockable: Stockable, calculable: Calculable) {
        self.stockable = stockable
        self.calculable = calculable
    }
    
    func receive(insertedMoney: Int) {
        calculable.plus(money: insertedMoney)
    }
    
    func currentMoney() -> Int {
        return calculable.currentBalance()
    }
    
    func addToStock(beverage: Beverage) {
        stockable.add(beverage: beverage)
    }
    
    @discardableResult
    func sell(wantedBeverage: Beverage) -> Result<Beverage,SellError> {
        guard calculable.isEnoughToBuy(price: wantedBeverage.price)
            else {
                return .failure(.insufficientMoneyError)
        }
        guard stockable.subtract(beverage: wantedBeverage)            else {
                return .failure(.nonExistentBeverageError)
        }
        
        stockable.logSaled(beverage: wantedBeverage)
        calculable.subtract(price: wantedBeverage.price)
        return .success(wantedBeverage)
    }

}

extension VendingMachine {
    func repeatSalesLog(handler: (Beverage) -> (Void)) {
        stockable.repeatSalesLog { handler($0) }
    }
    
    func repeatHotCoffees(handler: (Coffee) -> (Void)) {
        stockable.repeatBeverages { beverage in
            guard let hotCoffee = beverage as? Coffee, hotCoffee.isHot() else { return }
            
            handler(hotCoffee)
        }
    }
    
    func repeatMilksPassed(expirationDate: Date, handler: (Milk) -> (Void)) {
        stockable.repeatBeverages { beverage in
            guard let milk = beverage as? Milk,
                !milk.validate(with: expirationDate) else { return }
            
            handler(milk)
        }
    }
    
    func repeatAllBeverages(handler: (Beverage) -> (Void)) {
        stockable.repeatBeverages { handler($0) }
    }
}

extension VendingMachine {
    func stockByKind() -> [Beverage: Int] {
        var stockByKind = [Beverage: Int]()
        stockable.repeatBeverages {
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
        stockable.repeatBeverages {
            guard calculable.isEnoughToBuy(price: $0.price) else { return }
            
            if sellableBeverages.keys.contains($0) {
                sellableBeverages[$0]? += 1
            } else {
               sellableBeverages[$0] = 1
            }
        }
        return sellableBeverages
    }
}
