//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

struct Inventory {
    var strawberryMilk = 0
    var chocoMilk = 0
    var bananaMilk = 0
    var cola = 0
    var cider = 0
    var fanta = 0
    var cantata = 0
    var top = 0
    var georgia = 0
}


class VendingMachine {
    
    private var money: Int
    private var inventory: Inventory
    private var purchasedDrink: [Beverage]
    
    init(drinks: [Beverage]) {
        self.money = 0
        self.inventory = Inventory()
        self.purchasedDrink = []
    }
    
    
    //MARK:- Human to VendingMachine Method
    
    func collectingMoney(with money: Int) {
        
    }
    
    func add(item: Beverage) {
        
    }
    
    func purchase(drink: Beverage) {
        
    }
    
    
    //MARK:- VendingMachine to Human Method

    func availableDrink() -> [Beverage] {
        
        return []
    }
    
    func checkBalance() -> Int {
        
        return money
    }
    
    func inventoryList() -> [Beverage:Int] {
        
        return [:]
    }
    
    func expiredItems() -> [Beverage] {
        
        return []
    }
    
    func hotDrinks() -> [Beverage] {
        
        return []
    }
    
    func purchaseHistory() -> [Beverage] {
        
        return []
    }
    
    
}
