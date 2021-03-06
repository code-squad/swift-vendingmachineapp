//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private var money : Money
    private var beverages : Beverages
    private var bought : Beverages
    
    init(Money : Money){
        self.money = Money
        self.beverages = Beverages()
        self.bought = Beverages()
    }
    
    func addBeverage(beverage : Beverage){
        beverages.addBeverage(beverage: beverage)
    }
    
    func addMoney(money : Money){
        money.addMoney(money: money)
    }
    
    func buyBeverage(beverage : Beverage){
        if beverage.canBuybeverage(money: self.money){
            bought.addBeverage(beverage: beverage)
            self.beverages.takeBeverage(beverage: beverage)
        }
    }
    
    func currentBeverages() -> [String: Int]{
        return beverages.beveragesList()
    }
    
    func canBuyBeverageList() -> [Beverage] {
        return beverages.comparePrice(money: self.money)
    }
    
    func isValidateList() -> [Beverage]{
        return beverages.beverageValidate()
    }
    
    func isHotList() -> [Beverage]{
        return beverages.isHotBeverages()
    }
    
    func boughtList() -> [String: Int]{
        return bought.beveragesList()
    }
}
