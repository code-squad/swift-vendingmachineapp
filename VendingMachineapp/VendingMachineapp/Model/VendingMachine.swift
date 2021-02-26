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
    
    mutating func increaseMoney(moeny: Int) {
        self.money += money
    }
    
    func addBeverage(beverage: Beverage) {
        inventory.addBeverage(beverage: beverage)
    }
    
    func availablePurchaseList() -> [Beverage] {
        return inventory.availablePurchaseList(money: money)
    }
    
    func purchaseBeverage(beverage: Beverage) {
        inventory.subtractBeverage(beverage: beverage)
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
    
    func validateList(with date: Date) -> [Beverage] {
        return inventory.validateList(with: date)
    }
    
    func printList() {
        inventory.eachBeverage(handler: { (beverage) in
            print(beverage)
        })
    }
    
    func wholeBeverage() -> [Beverage:Int] {
        return inventory.wholeBeverage()
    }
    
}
