//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class VendingMachine {

    private var money: Money
    private var inventory: Inventory
    private var purchasedDrink: [Beverage]
    
    init() {
        self.money = Money()
        self.inventory = Inventory()
        self.purchasedDrink = []
    }
    
    
    //MARK:- Human to VendingMachine Method
    
    func collectMoney(with cash: Cash) -> Int {
        return money.add(cash)
    }
    
    func add(item: Beverage) {
        inventory.append(with: item)
    }
    
    func purchase(drink: Beverage.Type) {
        if let drink = inventory.remove(item: drink) {
            _ = money.sub(drink.price)
            purchasedDrink.append(drink)
        }
    }
    
    
    //MARK:- VendingMachine to Human Method

    func availableDrink() -> [Beverage] {
        return inventory.cheapItems(with: money.cash)
    }
    
    func checkBalance() -> Int {
        return money.cash
    }
    
    func inventoryList() -> [ObjectIdentifier:Int] {
        return inventory.getStockList()
    }
    
    func expiredItems() -> [Beverage] {
        return inventory.expiredItems()
    }
    
    func lowCaffeine() -> [Beverage] {
        return inventory.lowCaffeineItems()
    }
    
    func purchaseHistory() -> [Beverage] {
        return purchasedDrink
    }
    
    
}
