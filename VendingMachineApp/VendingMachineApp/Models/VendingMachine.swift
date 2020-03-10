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
    private var money = Quantity.zero
    
    init(stock: [Beverage]) {
        self.stock = stock
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
    
    mutating func receive(insertedMoney: Int) {
        money += insertedMoney
    }
    
    func currentMoney() -> Int {
        return money
    }
    
    mutating func add(beverage: Beverage) {
        stock.append(beverage)
    }
    
    func stockByKind() -> [Beverage: [Beverage]] {
        var stockByKind = [Beverage: [Beverage]]()
        for beverage in stock {
            guard stockByKind.keys.contains(beverage)
                else {
                    stockByKind[beverage]?.append(beverage)
                    continue
            }
            
            stockByKind[beverage] = [beverage]
        }
        return stockByKind
    }
    
}
