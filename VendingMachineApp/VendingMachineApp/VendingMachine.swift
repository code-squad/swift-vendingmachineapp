//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class VendingMachine : NSObject, NSCoding{
    private var money : Money
    private var currentBeverages : Beverages
    private var bought : Beverages
    private var BeverageFactory : [Beverage]
    
    override init() {
        self.money = Money.init(money: .OneThousand)
        self.currentBeverages = Beverages()
        self.bought = Beverages()
        BeverageFactory = currentBeverages.makeBeverageofFactroy()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.money, forKey: "Money")
        coder.encode(self.currentBeverages, forKey: "currentBeverages")
        coder.encode(self.bought, forKey: "boughtList")
        coder.encode(self.BeverageFactory, forKey: "BeverageFactory")
    }
    
    required init?(coder: NSCoder) {
        self.money = coder.decodeObject(forKey: "Money") as? Money ?? Money.init(money: .OneThousand)
        self.currentBeverages = coder.decodeObject(forKey: "currentBeverages") as? Beverages ?? Beverages()
        self.bought = coder.decodeObject(forKey: "boughtList") as? Beverages ?? Beverages()
        self.BeverageFactory = coder.decodeObject(forKey: "BeverageFactory") as? [Beverage] ?? []
    }
    
    func addBeverage(beverage : Beverage){
        currentBeverages.addBeverage(beverage: beverage)
    }
    
    func addMoney(money : Money){
        self.money.addMoney(money: money)
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
        return currentBeverages.showLowerpriceThan(money: self.money)
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
    
    func drawCurrentMoney() -> String{
        return money.description
    }
    
    func sendBeverageInFactory(index : Int) -> Beverage{
        return BeverageFactory[index]
    }
    
    func drawStockLabel(beverage : Beverage) -> Int{
        return currentBeverages.sendCurrentBeverageObjectIdentifierCount(beverage: beverage)
    }
}
