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
        if !stock.remove(at: product) {
            return false
        }
        money = product.payFor(with: money)
        return true
    }
    
    func checkMoney() -> Int {
        return money
    }
}
