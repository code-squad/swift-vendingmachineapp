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
    private var stock: [Beverage] {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.beveragesChanged,
                                            object: self)
        }
    }
    private var cashier: Calculable {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.balanceChanged,
                                            object: self)
        }
    }
    
    init(stock: [Beverage] = []) {
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
        stock.append(beverage)
    }
    
    @discardableResult
    func sell(wantedBeverage: Beverage) -> Result<Beverage,SellError> {
        guard cashier.isEnoughToBuy(price: wantedBeverage.price)
            else {
                return .failure(.insufficientMoneyError)
        }
        guard subtractFromStock(beverage: wantedBeverage)
            else {
                return .failure(.nonExistentBeverageError)
        }
        
        cashier.addToSalesLog(beverage: wantedBeverage)
        cashier.subtract(price: wantedBeverage.price)
        return .success(wantedBeverage)
    }
    
    private func subtractFromStock(beverage: Beverage) -> Bool {
        for index in 0 ..< stock.count {
            if stock[index] === beverage {
                stock.remove(at: index)
                return true
            }
        }
        return false
    }
}

extension VendingMachine {
    func searchSalesLog(handler: (Beverage) -> (Void)) {
        cashier.searchSalesLog { handler($0) }
    }
    
    func searchHotCoffees(handler: (Coffee) -> (Void)) {
        stock.filter { (beverage) -> Bool in
            guard let hotCoffee = beverage as? Coffee, hotCoffee.isHot()
                else {
                    return false
            }
            return true
        }.forEach {
            let hotCoffee = $0 as! Coffee
            handler(hotCoffee)
        }
    }
    
    func searchMilksPassed(expirationDate: Date, handler: (Milk) -> (Void)) {
        stock.filter { (beverage) -> Bool in
            guard let milkPassedExpirationDate = beverage as? Milk,
                !milkPassedExpirationDate.validate(with: expirationDate)
                else {
                    return false
            }
            return true
        }.forEach {
            let verifiedMilk = $0 as! Milk
            handler(verifiedMilk)
        }
    }
    
    func searchAllBeverages(handler: (Beverage) -> (Void)) {
        stock.forEach { handler($0) }
    }
}

extension VendingMachine {
    func stockByKind() -> [Beverage.Kind: Int] {
        var stockByKind = [Beverage.Kind: Int]()
        stock.forEach {
            guard !stockByKind.keys.contains($0.kind)
                else {
                    stockByKind[$0.kind]? += 1
                    return
            }
            stockByKind[$0.kind] = 1
        }
        return stockByKind
    }
    
    func sellableBeverages() -> [Beverage.Kind: Int] {
        var sellableBeverages = [Beverage.Kind: Int]()
        stock.forEach {
            guard !sellableBeverages.keys.contains($0.kind)
                else {
                    sellableBeverages[$0.kind]? += 1
                    return
            }
            guard cashier.isEnoughToBuy(price: $0.price)
                else {
                    return
            }
            sellableBeverages[$0.kind] = 1
        }
        return sellableBeverages
    }
}
