//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct VendingMachine {
    
    private var stock: [Beverage]
    private var cashier = Cashier()
    
    init(stock: [Beverage]) {
        self.stock = stock
    }
    
    mutating func receive(insertedMoney: Int) {
        cashier.plus(money: insertedMoney)
    }
    
    func currentMoney() -> Int {
        return cashier.currentBalance
    }
    
    mutating func addToStock(beverage: Beverage) {
        stock.append(beverage)
    }

    @discardableResult
    mutating func sell(wantedBeverage: Beverage) -> Beverage? {
        guard cashier.isEnoughToBuy(price: wantedBeverage.price),
            subtractFromStock(beverage: wantedBeverage)
            else {
                return nil
        }
        
        cashier.addToSalesLog(beverage: wantedBeverage)
        cashier.subtract(price: wantedBeverage.price)
        return wantedBeverage
    }
    
    mutating private func subtractFromStock(beverage: Beverage) -> Bool {
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
        for beverage in stock {
            guard let hotCoffee = beverage as? Coffee, hotCoffee.isHot()
                else {
                    continue
            }
            handler(hotCoffee)
        }
    }
    
    func searchMilksPassed(expirationDate: Date, handler: (Milk) -> (Void)) {
        for beverage in stock {
            guard let milkPassedExpirationDate = beverage as? Milk,
                !milkPassedExpirationDate.validate(with: expirationDate)
                else {
                    continue
            }
            handler(milkPassedExpirationDate)
        }
    }
    
    func searchStockByKind(handler: ((key: String, value: [Beverage])) -> (Void)) {
        let stockByKind = generateStockByKind()
        stockByKind.forEach {
            handler((key: $0.key,
            value: $0.value))
        }
    }
    
    private func generateStockByKind() -> [String: [Beverage]] {
        var stockByKind = [String: [Beverage]]()
        for beverage in stock {
            let typeToString = "\(type(of: beverage))"
            guard !stockByKind.keys.contains(typeToString)
                else {
                    stockByKind[typeToString]?.append(beverage)
                    continue
            }
            stockByKind[typeToString] = [beverage]
        }
        return stockByKind
    }
    
    func searchSellableBeverages(handler: ((key: String, value: [Beverage])) -> (Void)) {
        let sellableBeverages = generateSellableBeverages()
        sellableBeverages.forEach {
            handler((key: $0.key,
            value: $0.value))
        }
    }
    
    private func generateSellableBeverages() -> [String: [Beverage]] {
        var sellableBeverages = [String: [Beverage]]()
        for beverage in stock {
            let typeToString = "\(type(of: beverage))"
            guard !sellableBeverages.keys.contains(typeToString)
                else {
                    sellableBeverages[typeToString]?.append(beverage)
                    continue
            }
            guard cashier.isEnoughToBuy(price: beverage.price)
                else {
                    continue
            }
            sellableBeverages[typeToString] = [beverage]
        }
        return sellableBeverages
    }
    
}
