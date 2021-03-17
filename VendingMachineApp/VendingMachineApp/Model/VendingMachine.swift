//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class VendingMachine: NSObject, NSCoding {

    private var money: Money
    private var inventory: Inventory
    private var purchasedDrink: [Beverage]
    
    override init() {
        self.money = Money()
        self.inventory = Inventory()
        self.purchasedDrink = []
    }
    
    required init?(coder decoder: NSCoder) {
        money = decoder.decodeObject(forKey: "money") as! Money
        inventory = decoder.decodeObject(forKey: "inventory") as! Inventory
        purchasedDrink = decoder.decodeObject(forKey: "purchasedDrink") as! [Beverage]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(money, forKey: "money")
        coder.encode(inventory, forKey: "inventory")
        coder.encode(purchasedDrink, forKey: "purchasedDrink")
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
