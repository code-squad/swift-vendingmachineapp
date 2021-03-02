//
//  VendingMachine.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private var manager = VendingMachineManager()
    private var inventory = Inventory()
    private var money: Money
    
    init(money: Int) {
        self.money = Money(with: money)
    }
    
    mutating func increaseMoney(money: Int) {
        self.money.changeMoney(with: money)
    }
    
    func addBeverage(beverage: Beverage) {
        inventory.addBeverage(beverage: beverage)
    }
    
    func availablePurchaseList() -> [Beverage] {
        return manager.availablePurchaseList(inventory: inventory, money: money)
    }
    
    mutating func purchaseBeverage(beverage: Beverage) {
        manager.updatePurchaseList(inventory: inventory, beverage: beverage)
        self.money.changeMoney(with: -beverage.price)
    }
    
    func checkChagne() -> Money {
        return money.checkChange()
    }
    
    func purchasedList() -> [Beverage] {
        return manager.purchasedList()
    }
    
    func hotBeverageList() -> [Beverage] {
        return manager.hotBeverageList(inventory: inventory)
    }
    
    func invalidateList(with date: Date) -> [Beverage] {
        return manager.invalidateList(inventory: inventory, with: date)
    }
    
    func wholeBeverage() -> [Beverage:Int] {
        return inventory.wholeBeverage()
    }
    
}
