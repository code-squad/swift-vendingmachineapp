//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class VendingMachine : NSObject, NSCoding ,VendingMachined {

    enum NotificationName {
        static let updateBeverage = Notification.Name("updateBeverage")
        static let updateBalance = Notification.Name("updateBalance")
        static let updatePurchase = Notification.Name("updatePurchase")
    }
    
    private var drinks : Drinks
    private var payment : Payment
    private var purchasedList : PurchasedList
    
    override init() {
        self.drinks = Drinks()
        self.payment = Payment()
        self.purchasedList = PurchasedList()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(drinks, forKey: "drinks")
        coder.encode(payment, forKey: "payment")
        coder.encode(purchasedList, forKey: "purchasedList")
    }
    
    required init?(coder: NSCoder) {
        self.drinks = coder.decodeObject(forKey: "drinks") as! Drinks
        self.payment = coder.decodeObject(forKey: "payment") as! Payment
        self.purchasedList = coder.decodeObject(forKey: "purchasedList") as! PurchasedList
    }
    
    func showBeverageList(handler : (Beverage) -> Void) {
        drinks.showBeverageList {
            handler($0)
        }
    }
    
    func putPayMoney(money : Int) {
        payment.increase(money: money)
        NotificationCenter.default.post(name: VendingMachine.NotificationName.updateBalance, object: self)
    }
    
    func addStock(_ beverage : Beverage) {
        drinks.addStock(beverage : beverage)
        NotificationCenter.default.post(name: VendingMachine.NotificationName.updateBeverage, object: self)
    }
    
    func showPurchasePossibleList() -> [Beverage] {
        return payment.purchasePossibleList(drinks : drinks)
    }
    
    func purchaseBeverage(beverageType : Beverage.Type) {
        let beverage = BeverageFactory.make(beverageType)
        if payment.canPurchase(beverage: beverage) {
            payment.decrease(beverage: beverage)
            drinks.purchase(beverage: beverage)
            purchasedList.add(beverage: beverage)
            
            NotificationCenter.default.post(name: VendingMachine.NotificationName.updatePurchase, object: self, userInfo: ["beverage" : beverage])
            NotificationCenter.default.post(name: VendingMachine.NotificationName.updateBalance, object: self)
            NotificationCenter.default.post(name: VendingMachine.NotificationName.updateBeverage, object: self)
        }
    }
    
    func outOfDateInventory(standard : Date) -> [Beverage] {
        return drinks.passExpiryDate(standard: standard)
    }
    
    func verifyHotBeverages(standard : Int) -> [Beverage] {
        return drinks.hotDrink(standard: standard)
    }
    
    func checkCurrentBalance() -> Int {
        return payment.amountMoney
    }
    
    func purchaseHistory() -> [Beverage] {
        return purchasedList.beverages
    }
    
    func countDrink(beverage : Beverage) -> Int {
        drinks.count(beverage: beverage)
    }
    
    func showBeverageStock(drinkType : Beverage.Type) -> Int {
        return drinks.showAllBeverage()[ObjectIdentifier(drinkType)]?.count ?? 0
    }
}

