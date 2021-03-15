//
//  VendingMachine.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class VendingMachine: NSObject, NSCoding{
    
    private var manager = VendingMachineManager()
    private var inventory = Inventory()
    
    override init() {}
    
    required init?(coder: NSCoder) {
        self.manager = coder.decodeObject(forKey: "manager") as? VendingMachineManager ?? VendingMachineManager()
        self.inventory = coder.decodeObject(forKey: "inventory") as? Inventory ?? Inventory()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(manager, forKey: "manager")
        coder.encode(inventory, forKey: "inventory")
    }
    
    func initializeProductList() -> [Beverage] {
        return inventory.initializeProductList()
    }
    
    func increase(money: Money) {
        manager.changeMoney(with: money)
    }
    
    func add(beverage: Beverage) {
        inventory.add(beverage: beverage)
    }
    
    func availablePurchaseList() -> [Beverage] {
        return inventory.availablePurchaseList(money: manager.checkChange())
    }
    
    func purchase(beverage: Beverage.Type) {
        manager.updatePurchaseList(inventory: inventory, beverage: beverage)
    }
    
    func hotBeverageList() -> [Beverage] {
        var list: [Beverage] = []
        
        inventory.eachBeverage(handler: { (beverage) in
            if beverage.isHot(with: 50) {
                list.append(beverage)
            }
        })
        return list
    }
    
    func invalidateList(with date: Date) -> [Beverage] {
        var list: [Beverage] = []
        
        inventory.eachBeverage(handler: { (beverage) in
            if !beverage.validateExpiryTime(with: date) {
                list.append(beverage)
            }
        })
        return list
    }
    
    func checkChagne() -> Money {
        return manager.checkChange()
    }
    
    func purchasedList() -> [Beverage] {
        return manager.purchasedList()
    }
    
    func wholeBeverage() -> [Beverage:Int] {
        return inventory.wholeBeverage()
    }
    
}
