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
    private var milk : [Milk]
    private var soda : [Soda]
    private var energydrink : [Energydrink]
    private var coffee : [Coffee]
    private var bought : [Beverage]
    
    init(Money : Money){
        self.money = Money
        self.beverages = []
        self.milk = []
        self.soda = []
        self.energydrink = []
        self.coffee = []
        self.bought = []
    }
    
    func addMoney(money : Money){
        money.addMoney(money: money)
    }
    
    private func addMilk(milk : Milk){
        self.milk.append(milk)
    }
    
    private func addSoda(soda : Soda){
        self.soda.append(soda)
    }
    
    private func addCoffee(coffee : Coffee){
        self.coffee.append(coffee)
    }
    
    func addBeverage(beverage : Beverage){
        if let tempbeverage = beverage as? Milk{
            addMilk(milk: tempbeverage)
        }
        else if let tempbeverage = beverage as? Soda{
            addSoda(soda: tempbeverage)
        }
        else if let tempbeverage = beverage as? Coffee{
            addCoffee(coffee: tempbeverage)
        }
        else if let tempbeverage = beverage as? Energydrink{
            addEnergydrink(energyDrink: tempbeverage)
        }
    }
    
    func addEnergydrink(energyDrink : Energydrink){
        self.energydrink.append(energyDrink)
    }
    
    func canBuyBeverage() -> [Beverage]{
        addAllCurrentBeverages()
        var tempbeverages : [Beverage] = beverages
        for i in 0..<tempbeverages.count{
            if tempbeverages[i].canBuybeverage(money: money) {
                tempbeverages.remove(at: i)
            }
        }
        return tempbeverages
    }
    
    func buyMilk(){
        if let temp = milk.first{
            bought.append(temp)
            milk.removeFirst()
        }
    }
    
    func buySoda(){
        if let temp = soda.first{
            bought.append(temp)
            milk.removeFirst()
        }
    }
    
    func buyCoffee(){
        if let temp = coffee.first{
            bought.append(temp)
            coffee.removeFirst()
        }
    }
    
    func buyEnergyDrink(){
        if let temp = coffee.first{
            bought.append(temp)
            energydrink.removeFirst()
        }
    }
    
    func curretMoney() -> Int{
        return money.currentMoney()
    }
    
    func allBeverages() -> [Beverage]{
        addAllCurrentBeverages()
        return beverages
    }
    
    func isValidate() -> [Beverage]{
        addAllCurrentBeverages()
        var tempBeverages : [Beverage] = beverages
        for i in 0..<tempBeverages.count{
            if !tempBeverages[i].isValidate(with: Date()){
                tempBeverages.remove(at: i)
            }
        }
        return tempBeverages
    }
    
    func isHot() -> [Beverage]{
        addAllCurrentBeverages()
        var tempBeverages : [Beverage] = beverages
        for i in 0..<tempBeverages.count{
            if !tempBeverages[i].isHot(){
                tempBeverages.remove(at: i)
            }
        }
        return tempBeverages
    }
    
    func boughtList() -> [Beverage]{
        return bought
    }
    
    private func addAllCurrentBeverages(){
        beverages.removeAll()
        milk.forEach{beverages.append($0)}
        soda.forEach{beverages.append($0)}
        energydrink.forEach{beverages.append($0)}
        coffee.forEach{beverages.append($0)}
    }
    
}
