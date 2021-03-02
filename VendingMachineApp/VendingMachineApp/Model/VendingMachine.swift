//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

struct VendingMachine {
    private var money : Int
    private var stock : Drinks
    private var purchased : Drinks
    
    init() {
        self.money = 0
        self.stock = Drinks.init()
        self.purchased = Drinks.init()
    }
    
    mutating func insertMoney(howMuch inserted : Int) {
        money += inserted
    }
    
    mutating func addStock(what product : Drink) {
        stock.addDrink(what: product)
    }
    
    func availableList() -> Set<String> {
        var canBuyArray = [Drink]()
        stock.doClosure(closure: { drinks in
            canBuyArray = drinks.filter() {
                $0.canBuy(have: self.money)
            }
        })
        return Set(canBuyArray.map(){String($0.name)}) // name만 나오도록 수정해야 함.
    }
    
    /// if fail, return false
    mutating func buyProduct(what productType : Drink.Type) -> Bool{
        do {
            let purchasedItem = try stock.remove(at: productType)
            purchased.addDrink(what: purchasedItem)
            money = purchasedItem.payFor(with: money)
        }
        catch {
            return false
        }
        return true
    }
    
    func checkMoney() -> Int {
        return money
    }
    
    func showStock() -> Dictionary<String,Int> {
        var returnDic = Dictionary<String,Int>()
        
        stock.doClosure(closure: { drinks in
            drinks.forEach({
                if returnDic[$0.name] == nil {
                    returnDic.updateValue(1, forKey: $0.name)
                }
                else {
                    returnDic.updateValue(returnDic[$0.name]! + 1, forKey: $0.name)
                }
            })
        })
        
        return returnDic
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
