//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private var money : Money
    private var beverages : [Beverage]
    private var bought : [Beverage]
    
    init(Money : Money){
        self.money = Money
        self.beverages = []
        self.bought = []
    }
    
    func addMoney(money : Money){
        money.addMoney(money: money)
    }
    
    func canBuyBeverage() -> [Beverage]{
        addAllCurrentBeverages()
        var tempbeverages : [Beverage] = []
        for i in 0..<beverages.count{
            if beverages[i].canBuybeverage(money: self.money) {
                tempbeverages.append(beverages[i])
            }
        }
        return tempbeverages
    }
    
    func allBeverages() -> [Beverage]{
        addAllCurrentBeverages()
        return beverages
    }
    
    func isValidate() -> [Beverage]{
        addAllCurrentBeverages()
        var tempBeverages : [Beverage] = []
        for i in 0..<beverages.count{
            if beverages[i].isValidate(Date()){
                tempBeverages.append(beverages[i])
            }
        }
        return tempBeverages
    }
    
    func isHot() -> [Beverage]{
        addAllCurrentBeverages()
        var tempBeverages : [Beverage] = []
        for i in 0..<beverages.count{
            if beverages[i].isHot(){
                tempBeverages.append(beverages[i])
            }
        }
        return tempBeverages
    }
    
    func boughtList() -> [Beverage]{
        return bought
    }
    
    private func addAllCurrentBeverages(){
        beverages.removeAll()
    }
}
