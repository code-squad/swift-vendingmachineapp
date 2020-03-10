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
    private var money = Quantity.zero
    
    init(stock: [Beverage]) {
        self.stock = stock
    }
    
    mutating func receive(insertedMoney: Int) {
        money += insertedMoney
    }
    
    func currentMoney() -> Int {
        return money
    }
    
    mutating func add(beverage: Beverage) {
        stock.append(beverage)
    }
    
    mutating func sell(wantedBeverage: Beverage) -> Beverage? {
        if let beverage = subtractFromStock(to: wantedBeverage) {
            addFromSoldBeverages(to: beverage)
            subtractFromMoney(to: beverage.price)
            return beverage
        }
        return nil
    }
    
    mutating private func subtractFromStock(to wantedBeverage: Beverage) -> Beverage? {
        for index in 0 ..< stock.count {
            if stock[index] == wantedBeverage {
                return stock.remove(at: index)
            }
        }
        return nil
    }
    
    mutating private func addFromSoldBeverages(to beverage: Beverage) {
        soldBeverages.append(beverage)
    }
    
    mutating private func subtractFromMoney(to price: Int) {
        guard money >= price
            else {
                return
        }
        money -= price
    }
    
    func searchSoldBeverages() -> [Beverage] {
        return soldBeverages
    }
    
    func hotCoffees() -> [Coffee] {
        var hotCoffees = [Coffee]()
        for beverage in stock {
            guard let hotCoffee = beverage as? Coffee, hotCoffee.isHot()
                else {
                    continue
            }
            
            hotCoffees.append(hotCoffee)
        }
        return hotCoffees
    }
    
    func milksPassed(expirationDate: Date) -> [Milk] {
        var milksPassedExpirationDate = [Milk]()
        for beverage in stock {
            guard let milkPassedExpirationDate = beverage as? Milk,
                !milkPassedExpirationDate.validate(with: expirationDate)
                else {
                    continue
            }
            
            milksPassedExpirationDate.append(milkPassedExpirationDate)
        }
        return milksPassedExpirationDate
    }
    
    func stockByKind() -> [Beverage: [Beverage]] {
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
    
    func sellableBeverages() -> [Beverage: [Beverage]] {
        var sellableBeverages = [Beverage: [Beverage]]()
        for beverage in stock {
            guard !sellableBeverages.keys.contains(beverage)
                else {
                    sellableBeverages[beverage]?.append(beverage)
                    continue
            }
            guard beverage.isBuyable(money: money)
                else {
                    continue
            }
            sellableBeverages[beverage] = [beverage]
        }
        return sellableBeverages
    }
    
}
