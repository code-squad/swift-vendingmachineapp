//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

struct VendingMachine {
    private var money : SafeBox
    private var stock : Drinks
    private var purchased : Drinks
    
    init() {
        self.money = SafeBox.init(money: 0)
        self.stock = Drinks.init()
        self.purchased = Drinks.init()
    }
    
    mutating func insertMoney(howMuch inserted : Int) {
        money.deposit(howMuch: inserted)
    }
    
    mutating func addStock(what product : Drink) {
        stock.addDrink(what: product)
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
    mutating func buyProduct(what productType : Drink.Type) -> Bool{
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
    
    func showStock() -> Dictionary<String,Int> {
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
        var returnDrinkArr = [Drink]()
        stock.doClosure(closure: { drinks in
            drinks.forEach({
                if let downCasting = $0 as? Milk {
                    if downCasting.isWithInExpiration() == false {
                        returnDrinkArr.append(downCasting)
                    }
                }
            })
        })
        
        return returnDrinkArr
    }
    
    func hotDrinks() -> Set<String> {
        var returnDrinkArr = Set<String>()
        stock.doClosure(closure: { drinks in
            drinks.forEach({
                if let downCasting = $0 as? TOP {
                    if downCasting.isHot() == true {
                        returnDrinkArr.insert(downCasting.name)
                    }
                }
            })
        })
        
        return returnDrinkArr
    }
}
