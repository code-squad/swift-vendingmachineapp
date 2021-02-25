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
        self.money = 900
        self.stock = Drinks.init()
        self.purchased = Drinks.init()
    }
    
    mutating func insertMoney(howMuch inserted : Int) {
        money += inserted
    }
    
    mutating func addStock(what product : Drink) {
        stock.addDrink(what: product)
    }
    
    func availableList() -> [String] {
        var canBuyArray = [Drink]()
        stock.doClosure(closure: { drinks in
            canBuyArray = drinks.filter() {
                $0.canBuy(have: self.money)
            }
        })
        return canBuyArray.map(){String($0.description)} // name만 나오도록 수정해야 함.
    }
    
    /// if fail, return false
    mutating func buyProduct(what product : Drink) -> Bool{
        do {
            let purchasedItem = try stock.remove(at: product)
            purchased.addDrink(what: purchasedItem)
        }
        catch {
            return false
        }
        money = product.payFor(with: money)
        return true
    }
    
    func checkMoney() -> Int {
        return money
    }
    
    func showStock() -> Dictionary<Drink,Int> {
        var returnDic = Dictionary<Drink,Int>()
        
        stock.doClosure(closure: { drinks in
            drinks.forEach({
                if returnDic[$0] == nil {
                    returnDic.updateValue(1, forKey: $0)
                }
                else {
                    returnDic.updateValue(returnDic[$0]! + 1, forKey: $0)
                }
            })
        })
        
        return returnDic
    }
    
    func purchasedList() -> [String] {
        var returnArr = [String]()
        purchased.doClosure(closure: { drinks in
            drinks.forEach({
                returnArr.append($0.description)
            })
        })
        
        return returnArr
    }
    
    func expiredStock() -> [Drink] {
        var returnDrinkArr = [Drink]()
        stock.doClosure(closure: { drinks in
            drinks.forEach({
                if let downCasting = $0 as? Milk {
                    if downCasting.validate() == false {
                        returnDrinkArr.append(downCasting)
                    }
                }
            })
        })
        
        return returnDrinkArr
    }
    
    func hotDrinks() -> [Drink] {
        var returnDrinkArr = [Drink]()
        stock.doClosure(closure: { drinks in
            drinks.forEach({
                if let downCasting = $0 as? TOP {
                    if downCasting.isHot() == true {
                        returnDrinkArr.append(downCasting)
                    }
                }
            })
        })
        
        return returnDrinkArr
    }
}
