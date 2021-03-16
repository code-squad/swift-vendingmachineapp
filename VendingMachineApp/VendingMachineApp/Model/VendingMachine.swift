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
    private var drinkMenu : DrinkMenu
    private var paymentMenu : PaymentMenu
    
    
    static let updateBeverage = Notification.Name("updateBeverage")
    static let updateBalance = Notification.Name("updateBalance")
    
    override init() {
        self.drinks = Drinks()
        self.payment = Payment()
        self.purchasedList = PurchasedList()
        self.drinkMenu = DrinkMenu()
        self.paymentMenu = PaymentMenu()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(drinks, forKey: "drinks")
        coder.encode(payment, forKey: "payment")
        coder.encode(purchasedList, forKey: "purchasedList")
        coder.encode(drinkMenu, forKey: "drinkMenu")
        coder.encode(paymentMenu, forKey: "paymentMenu")
    }
    
    required init?(coder: NSCoder) {
        self.drinks = coder.decodeObject(forKey: "drinks") as! Drinks
        self.payment = coder.decodeObject(forKey: "payment") as! Payment
        self.purchasedList = coder.decodeObject(forKey: "purchasedList") as! PurchasedList
        self.drinkMenu = coder.decodeObject(forKey: "drinkMenu") as! DrinkMenu
        self.paymentMenu = coder.decodeObject(forKey: "paymentMenu") as! PaymentMenu
    }
    
    func showBeverageList(handler : (Beverage) -> Void) {
        drinks.showBeverageList {
            handler($0)
        }
    }
    
    func putPayMoney(buttonIndex : Int) {
        let money = paymentMenu.list[buttonIndex]
        payment.increase(money: money)
        NotificationCenter.default.post(name: VendingMachine.updateBalance, object: self, userInfo: ["amountMoney" : payment.amountMoney])
    }
    
    func addStock(buttonIndex : Int) {
        let beverage = drinkMenu.list[buttonIndex]
        drinks.addStock(beverage : beverage)
        NotificationCenter.default.post(name: VendingMachine.updateBeverage, object: self, userInfo: ["drinklist" : drinks.showAllBeverage()])
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
    
    func showDrinkMenuList() -> [Beverage] {
        return drinkMenu.list
    }
    
    private func showPaymentMenuList() -> [Int] {
        return paymentMenu.list
    }
    
    func showAllBeverageStock(handler : (Int, Int) -> Void){
        drinkMenu.list.enumerated().forEach {
            handler($0.offset, drinks.showAllBeverage()[ObjectIdentifier(type(of: $0.element))]?.count ?? 0)
        }
    }
}

