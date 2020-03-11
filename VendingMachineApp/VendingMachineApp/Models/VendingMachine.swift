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
    private var soldBeverages = [Beverage]()
    private let cashier = Cashier()
    
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
        if subtractFromStock(beverage: wantedBeverage) {
            addToSoldBeverages(beverage: wantedBeverage)
            subtractFromMoney(to: wantedBeverage.price)
            return wantedBeverage
        }
        return nil
    }
    
    mutating private func subtractFromStock(beverage: Beverage)-> Bool {
        for index in 0 ..< stock.count {
            if stock[index] === beverage {
                stock.remove(at: index)
                return true
            }
        }
        return false
    }
    
    mutating private func addToSoldBeverages(beverage: Beverage) {
        soldBeverages.append(beverage)
    }
    
    mutating private func subtractFromMoney(to price: Int) {
        guard cashier.isEnoughToBuy(price: price)
            else {
                return
        }
        cashier.subtract(price: price)
    }
    
}

extension VendingMachine {
    
    func searchSoldBeverages(handler: (Beverage) -> (Void)) {
        soldBeverages.forEach { handler($0) }
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
    
    func searchStockByKind(handler: ((key: Beverage, value: [Beverage])) -> (Void)) {
        let stockByKind = generateStockByKind()
        stockByKind.forEach {
            handler((key: $0.key,
            value: $0.value))
        }
    }
    
    private func generateStockByKind() -> [Beverage: [Beverage]] {
        var stockByKind = [Beverage: [Beverage]]()
        for beverage in stock {
            guard !stockByKind.keys.contains(beverage)
                else {
                    stockByKind[beverage]?.append(beverage)
                    continue
            }
            stockByKind[beverage] = [beverage]
        }
        return stockByKind
    }
    
    func searchSellableBeverages(handler: ((key: Beverage, value: [Beverage])) -> (Void)) {
        let sellableBeverages = generateSellableBeverages()
        sellableBeverages.forEach {
            handler((key: $0.key,
            value: $0.value))
        }
    }
    
    private func generateSellableBeverages() -> [Beverage: [Beverage]] {
        var sellableBeverages = [Beverage: [Beverage]]()
        for beverage in stock {
            guard !sellableBeverages.keys.contains(beverage)
                else {
                    sellableBeverages[beverage]?.append(beverage)
                    continue
            }
            guard cashier.isEnoughToBuy(price: beverage.price)
                else {
                    continue
            }
            sellableBeverages[beverage] = [beverage]
        }
        return sellableBeverages
    }
    
}
