//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class VendingMachine : NSObject, NSCoding {
    private var drinks : Drinks
    private var payment : Payment
    private var purchasedList : PurchasedList
    private var menu : DrinkMenu
    
    override init() {
        self.drinks = Drinks()
        self.payment = Payment()
        self.purchasedList = PurchasedList()
        self.menu = DrinkMenu()
        menu.addAllMenu()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(drinks, forKey: "drinks")
        coder.encode(payment, forKey: "payment")
        coder.encode(purchasedList, forKey: "purchasedList")
        coder.encode(menu, forKey: "menu")
    }
    
    required init?(coder: NSCoder) {
        self.drinks = coder.decodeObject(forKey: "drinks") as! Drinks
        self.payment = coder.decodeObject(forKey: "payment") as! Payment
        self.purchasedList = coder.decodeObject(forKey: "purchasedList") as! PurchasedList
        self.menu = coder.decodeObject(forKey: "menu") as! DrinkMenu
    }
    
    func showBeverageList(handler : (Beverage) -> Void) {
        drinks.showBeverageList {
            handler($0)
        }
    }
    
    func putPayMoney(money : Int) {
        payment.increase(money: money)
    }
    
    func addStock(beverage : Beverage) {
        drinks.addStock(beverage : beverage)
    }
    
    func showPurchasePossibleList() -> [Beverage] {
        return payment.purchasePossibleList(drinks : drinks)
    }
    
    func purchaseBeverage(beverage : Beverage) {
        if payment.canPurchase(beverage: beverage) {
            payment.decrease(beverage: beverage)
            drinks.purchase(beverage: beverage)
            purchasedList.add(beverage: beverage)
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
    
    func showMenuList() -> [Beverage] {
        return menu.list
    }
    
    func showAllBeverageStock(handler : (Int,Int) -> Void) {
        menu.list.enumerated().forEach { (beverage) in
            drinks.showBeverageCount(beverage: beverage.element) { (count) in
                handler(beverage.offset,count)
            }
        }
    }
}
