//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class VendingMachine : NSCoding {
    private var money : SafeBox
    private var stock : Drinks
    private var purchased : Drinks
    
    init() {
        self.money = SafeBox.init(money: 0)
        self.stock = Drinks.init()
        self.purchased = Drinks.init()
    }
    
    required init?(coder: NSCoder) {
        money = coder.decodeObject(forKey: "money") as! SafeBox
        stock = coder.decodeObject(forKey: "stock") as! Drinks
        purchased = coder.decodeObject(forKey: "purchased") as! Drinks
    }
    
    func insertMoney(howMuch inserted : Int) {
        money.deposit(howMuch: inserted)
    }
    
    func addStock(what product : Drink) {
        stock.addDrink(what: product)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(money,forKey: "money")
        coder.encode(stock,forKey: "stock")
        coder.encode(purchased,forKey: "purchased")
    }
    
    func initialStock(howMany count : Int) {
            for _ in 0..<count {
                self.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: ChocoMilk.self))
                self.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: StrawberryMilk.self))
                self.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: Cider.self))
                self.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: Cola.self))
                self.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: TOP.self))
                self.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: Cantata.self))
            }
        }
    
    func availableList() -> Set<String> {
        var canBuyArray = [Drink]()
        stock.doClosure(closure: { drinks in
            canBuyArray = drinks.filter() {
                $0.canBuy(have: money.checkBalance())
            }
        })
        return Set(canBuyArray.map(){String($0.name)}) // name만 나오도록 수정해야 함.
    }
    
    /// if fail, return false
    func buyProduct(what productType : Drink.Type) -> Bool{
        do {
            let purchasedItem = try stock.remove(at: productType)
            if money.withdrawal(howMuch: purchasedItem.payFor()) == false {
                stock.addDrink(what: purchasedItem)
                return false
            }
            purchased.addDrink(what: purchasedItem)
        }
        catch {
            return false
        }
        return true
    }
    
    func checkMoney() -> Int {
        return money.checkBalance()
    }
    
    func showStock() -> Dictionary<ObjectIdentifier,[Drink]> {
        return stock.showDrinks()
    }
    
    func purchasedList() -> [String] {
        var returnArr = [String]()
        purchased.doClosure(closure: { drinks in
            drinks.forEach({
                returnArr.append($0.name)
            })
        })
        
        return returnArr
    }
    
    func expiredStock() -> [Drink] {
        return stock.showExpired()
    }
    
    func hotDrinks() -> Set<String> {
        return stock.showHotDrinks()
    }
    
    func doClosure(closure : ((VendingMachine) -> Void)) {
        closure(self)
    }
}
