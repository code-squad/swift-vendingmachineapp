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
    private var bananaMilk : [BananaMilk]
    private var strawBerryMilk : [StrawBerryMilk]
    private var cider : [Cider]
    private var coke : [Coke]
    private var monster : [Monster]
    private var diablo : [Diablo]
    private var caffeMocha : [CaffeMocha]
    private var caffeLatte : [CaffeeLatte]
    private var bought : [Beverage]
    
    init(Money : Money){
        self.money = Money
        self.beverages = []
        self.bananaMilk = []
        self.strawBerryMilk = []
        self.cider = []
        self.coke = []
        self.monster = []
        self.diablo = []
        self.bought = []
        self.caffeLatte = []
        self.caffeMocha = []
    }
    
    func addMoney(money : Money){
        money.addMoney(money: money)
    }
    
    func addBeverage(beverage : Beverage){
        if let tempbeverage = beverage as? BananaMilk{
            addBananaMilk(bananaMilk: tempbeverage)
        }
        else if let tempbeverage = beverage as? StrawBerryMilk{
            addStrawBerryMilk(strawBerryMilk: tempbeverage)
        }
        else if let tempbeverage = beverage as? Cider{
            addCider(cider: tempbeverage)
        }
        else if let tempbeverage = beverage as? Coke{
            addCoke(coke: tempbeverage)
        }
        else if let tempbeverage = beverage as? CaffeMocha{
            addCaffeMocha(caffeMocha: tempbeverage)
        }
        else if let tempbeverage = beverage as? CaffeeLatte{
            addCaffeLatte(caffeLatte: tempbeverage)
        }
        else if let tempbeverage = beverage as? Monster{
            addMonster(monster: tempbeverage)
        }
        else if let tempbeverage = beverage as? Diablo{
            addDiablo(diablo: tempbeverage)
        }
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
    
    func buybananMilk(){
        if let temp = bananaMilk.first{
            bought.append(temp)
            bananaMilk.removeFirst()
        }
    }
    
    func buyStrawberryMilk(){
        if let temp = strawBerryMilk.first{
            bought.append(temp)
            strawBerryMilk.removeFirst()
        }
    }
    
    func buyCaffeLatte(){
        if let temp = caffeLatte.first{
            bought.append(temp)
            caffeLatte.removeFirst()
        }
    }
    
    func buyCaffeMocha(){
        if let temp = caffeMocha.first{
            bought.append(temp)
            caffeMocha.removeFirst()
        }
    }
    
    func buyCider(){
        if let temp = cider.first{
            bought.append(temp)
            cider.removeFirst()
        }
    }
    
    func buyCoke(){
        if let temp = coke.first{
            bought.append(temp)
            coke.removeFirst()
        }
    }
     
    func buyMonster(){
        if let temp = monster.first{
            bought.append(temp)
            monster.removeFirst()
        }
    }
    
    func buyDiablo(){
        if let temp = diablo.first{
            bought.append(temp)
            diablo.removeFirst()
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
        var tempBeverages : [Beverage] = []
        for i in 0..<beverages.count{
            if beverages[i].isValidate(with: Date()){
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
        bananaMilk.forEach{beverages.append($0)}
        strawBerryMilk.forEach{beverages.append($0)}
        cider.forEach{beverages.append($0)}
        coke.forEach{beverages.append($0)}
        caffeMocha.forEach{beverages.append($0)}
        caffeLatte.forEach{beverages.append($0)}
        monster.forEach{beverages.append($0)}
        diablo.forEach{beverages.append($0)}
    }
    
    private func addBananaMilk(bananaMilk : BananaMilk){
        bought.append(bananaMilk)
        self.bananaMilk.append(bananaMilk)
    }
    private func addStrawBerryMilk(strawBerryMilk : StrawBerryMilk){
        bought.append(strawBerryMilk)
        self.strawBerryMilk.append(strawBerryMilk)
    }
    private func addCider(cider : Cider){
        bought.append(cider)
        self.cider.append(cider)
    }
    private func addCoke(coke : Coke){
        bought.append(coke)
        self.coke.append(coke)
    }
    private func addCaffeMocha(caffeMocha: CaffeMocha){
        bought.append(caffeMocha)
        self.caffeMocha.append(caffeMocha)
    }
    private func addCaffeLatte(caffeLatte : CaffeeLatte){
        bought.append(caffeLatte)
        self.caffeLatte.append(caffeLatte)
    }
    private func addDiablo(diablo : Diablo){
        bought.append(diablo)
        self.diablo.append(diablo)
    }
    private func addMonster(monster : Monster){
        bought.append(monster)
        self.monster.append(monster)
    }
}
