//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private var money : Money
    private var currentBeverages : Beverages
    private var bought : Beverages
    
    init(Money : Money){
        self.money = Money
        self.currentBeverages = Beverages()
        self.bought = Beverages()
    }
    
    func addBeverage(beverage : Beverage){
        currentBeverages.addBeverage(beverage: beverage)
    }
    
    func addMoney(money : Money){
        money.addMoney(money: money)
    }
    
    func buyBeverage(beverage : Beverage){
        if beverage.canBuybeverage(money: self.money){
            bought.addBeverage(beverage: beverage)
            self.currentBeverages.takeBeverage(beverage: beverage)
        }
    }
    
    func showcurrentBeverages() -> [String: Int]{
        return currentBeverages.beveragesList()
    }
    
    func canBuyBeverageList() -> [Beverage] {
        return currentBeverages.showLowerpriceThanMoney(money: self.money)
    }
    
    func isValidateList() -> [Beverage]{
        return currentBeverages.showValidatecurrentBeverageList()
    }
    
    func isHotList() -> [Beverage]{
        return currentBeverages.isHotBeverages()
    }
    
    func boughtList() -> [String: Int]{
        return bought.beveragesList()
    }
}
