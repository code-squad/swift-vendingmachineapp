//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

enum Money: Int {
    case coin = 100
    case coins = 500
    case bill = 1000
    case bills = 5000
}

class VendingMachine {

    
    private var money: Int
    private var inventory: Inventory
    private var purchasedDrink: [Beverage]
    
    init() {
        self.money = 0
        self.inventory = Inventory()
        self.purchasedDrink = []
    }
    
    
    //MARK:- Human to VendingMachine Method
    
    func collectMoney(with money: Money) {
        self.money += money.rawValue
    }
    
    func add(item: Beverage) {
        inventory.append(with: item)
    }
    
    func purchase(drink: Beverage.Type) {
        self.money -= drink.init().price
        inventory.remove(item: drink)
        purchasedDrink.append(drink.init())
    }
    
    
    //MARK:- VendingMachine to Human Method

    func availableDrink() -> [Beverage] {
        return inventory.cheapItems(with: money)
    }
    
    func checkBalance() -> Int {
        return money
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
