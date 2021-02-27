//
//  VendingMachine.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

struct VendingMachine {
    private var inventory = Inventory()
    private var money: Int
    
    init(money: Int) {
        self.money = money
    }
    
    mutating func increaseMoney(money: Int) {
        self.money += money
    }
    
    func addBeverage(beverage: Beverage) {
        inventory.addBeverage(beverage: beverage)
    }
    
    func availablePurchaseList() -> [Beverage] {
        return inventory.availablePurchaseList(money: money)
    }
    
    mutating func purchaseBeverage(beverage: Beverage) {
        inventory.subtractBeverage(beverage: beverage)
        money -= beverage.price
    }
    
    func checkChagne() -> Int {
        return money
    }
    
    func purchasedList() -> [Beverage] {
        return inventory.purchasedList()
    }
    
    func hotBeverageList() -> [Beverage] {
        return inventory.hotBeverageList()
    }
    
    func invalidateList(with date: Date) -> [Beverage] {
        return inventory.invalidateList(with: date)
    }
    
    func wholeBeverage() -> [Beverage:Int] {
        return inventory.wholeBeverage()
    }
    
}
