//
//  VendingMachine.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class VendingMachine: NSObject, NSCoding{
    
    enum Notification {
        static let didChangedStock = Foundation.Notification.Name("didChangedStock")
        static let didChangedMoney = Foundation.Notification.Name("didChangedMoney")
        static let didChangedPurchased = Foundation.Notification.Name("didChangedPurchased")
    }
    
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
    
    func getProductList() -> [Beverage] {
        return inventory.getProductList()
    }
    
    func increase(money: Money) {
        manager.updateMoney(with: money)
        NotificationCenter.default.post(name: Notification.didChangedMoney, object: self)
    }
    
    func add(beverage: Beverage) {
        inventory.add(beverage: beverage)
        NotificationCenter.default.post(name: Notification.didChangedStock, object: self, userInfo: wholeBeverage())
    }
    
    func availablePurchaseList() -> [Beverage] {
        return inventory.availablePurchaseList(money: manager.checkChange())
    }
    
    func purchase(beverage: Beverage.Type) {
        manager.updatePurchaseList(inventory: inventory, beverage: beverage)
        NotificationCenter.default.post(name: Notification.didChangedStock, object: self, userInfo: wholeBeverage())
        NotificationCenter.default.post(name: Notification.didChangedPurchased, object: self)
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
    
    func checkChange() -> Money {
        return manager.checkChange()
    }
    
    func purchasedList() -> [Beverage] {
        return manager.purchasedList()
    }
    
    func wholeBeverage() -> [Beverage:Int] {
        return inventory.wholeBeverage()
    }
    
}
