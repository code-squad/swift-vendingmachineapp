//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by delma on 29/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class VendingMachine: NSObject, NSCoding {
    private var beverages: Beverages
    private(set) var balance: Money
    private var purchasedList: [Beverage]
    var bananaMilk = BananMilk(manufacturer: "연세우유", brand: "곰곰", capacity: 200, price: Money(balance: 1200), name: "곰곰 바나나우유", manufacturedDate: Date(), expirationDate: Date(), fatRatio: .original, isLactoFree: false, temperature: 8, bananaCountry: "케냐")
    var chocoMilk = ChocoMilk(manufacturer: "덴마크우유", brand: "덴마크우유", capacity: 300, price: Money(balance: 1600), name: "초코초코우유", manufacturedDate: Date(), expirationDate: Date(), fatRatio: .lower, isLactoFree: false, temperature: 8, chocolateRatio: 30.0)
    var strawberryMilk = StrawberryMilk(manufacturer: "덴마크우유", brand: "덴마크우유", capacity: 300, price: Money(balance: 1600), name: "딸기딸기우유", manufacturedDate: Date(), expirationDate: Date(), fatRatio: .free, temperature: 8, strawberryConcentrateRatio: 20)
    var americano = Americano(manufacturer: "맥심", brand: "티오피", capacity: 255, price: Money(balance: 1400), name: "스위트 아메리카노", manufacturedDate: Date(), expirationDate: Date(), isContainMilk: false, package: .can, temperature: 70, coffeeBean: "에티오피아")
    var latte = Latte(manufacturer: "매일유업", brand: "마이카페라떼", capacity: 200, price: Money(balance: 1400), name: "마이카페라떼 마일드", manufacturedDate: Date(), expirationDate: Date(), isContainMilk: true, package: .plastic, temperature: 8, sugarAmount: 15)
    var mocha = Mocha(manufacturer: "동서식품", brand: "스타벅스", capacity: 300, price: Money(balance: 2200), name: "스타벅스 프라푸치노 모카", manufacturedDate: Date(), expirationDate: Date(), isContainMilk: true, package: .glass, temperature: 8, wheepCreamAmount: 30)
    var coke = Coke(manufacturer: "코카콜라", brand: "코카콜라", capacity: 355, price: Money(balance: 1800), name: "코카콜라", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .original, temperature: 8, cocaLeafRatio: 10.0)
    var cider = Cider(manufacturer: "코카콜라", brand: "스프라이트", capacity: 355, price: Money(balance: 1800), name: "스프라이트", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .lower, temperature: 8, flavor: .lemon)
    var milkis = Milkis(manufacturer: "롯데", brand: "밀키스", capacity: 355, price: Money(balance: 1400), name: "밀키스", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .original, temperature: 4, milkRatio: 20.0)
     var products: [Beverage]
    
    override init() {
        beverages = Beverages()
        balance = Money()
        purchasedList = []
        self.products = [bananaMilk, chocoMilk, strawberryMilk, americano, latte, mocha, coke, cider, milkis]
    }
    
    required init?(coder: NSCoder) {
        guard let beverages = coder.decodeObject(forKey: "beverages") as? Beverages else { return nil }
        guard let balance = coder.decodeObject(forKey: "balance") as? Money else { return nil }
        guard let purchasedList = coder.decodeObject(forKey: "purchasedList") as? [Beverage] else { return nil }
        guard let products = coder.decodeObject(forKey: "products") as? [Beverage] else { return nil }
        
        guard let bananaMilk = coder.decodeObject(forKey: "bananaMilk") as? BananMilk else { return nil }
        guard let chocoMilk = coder.decodeObject(forKey: "chocoMilk") as? ChocoMilk else { return nil }
        guard let strawberryMilk = coder.decodeObject(forKey: "strawberryMilk") as? StrawberryMilk else { return nil }
        
        guard let americano = coder.decodeObject(forKey: "americano") as? Americano else { return nil }
        guard let latte = coder.decodeObject(forKey: "latte") as? Latte else { return nil }
        guard let mocha = coder.decodeObject(forKey: "mocha") as? Mocha else { return nil }
        
        guard let coke = coder.decodeObject(forKey: "coke") as? Coke else { return nil }
        guard let cider = coder.decodeObject(forKey: "cider") as? Cider else { return nil }
        guard let milkis = coder.decodeObject(forKey: "milkis") as? Milkis else { return nil }

        self.beverages = beverages
        self.balance = balance
        self.purchasedList = purchasedList
        self.products = products
        
        self.bananaMilk = bananaMilk
        self.chocoMilk = chocoMilk
        self.strawberryMilk = strawberryMilk
        
        self.americano = americano
        self.latte = latte
        self.mocha = mocha
        
        self.coke = coke
        self.cider = cider
        self.milkis = milkis
     }
     
    func encode(with coder: NSCoder) {
        coder.encode(self.beverages, forKey: "beverages")
        coder.encode(self.balance, forKey: "balance")
        coder.encode(self.purchasedList, forKey: "purchasedList")
        coder.encode(self.products, forKey: "products")
        
        coder.encode(self.bananaMilk, forKey: "bananaMilk")
        coder.encode(self.chocoMilk, forKey: "chocoMilk")
        coder.encode(self.strawberryMilk, forKey: "strawberryMilk")
        
        coder.encode(self.americano, forKey: "americano")
        coder.encode(self.latte, forKey: "latte")
        coder.encode(self.mocha, forKey: "mocha")
        
        coder.encode(self.coke, forKey: "coke")
        coder.encode(self.cider, forKey: "cider")
        coder.encode(self.milkis, forKey: "milkis")
    }
    
    func showTotalStock() {
        beverages.forEachBeverages { print($0.description) }
    }
    
    func raiseMoney(moneyUnit: Money.MoneyUnit) {
        balance.raiseMoney(moneyUnit: moneyUnit)
    }

    func addStock(_ index: Int) {
        beverages.addBeverage(products[index])
         let beverageCount = beverages.reportBeverageCount(products[index])
         NotificationCenter.default.post(name: .updateBeverageCountLabel, object: (index, beverageCount))
    }

    func reportAvailableBeverageNowMoney() -> [Beverage] {
        return beverages.reportAvailableBeverageNowMoney(confirmBalance())
    }

    func purchaseBeverage(index: Int) {
        balance.subtract(products[index].price)
        beverages.removeBeverage(products[index])
        purchasedList.append(products[index])
    }

    func confirmBalance() -> Money {
        return balance
    }
    
    func reportTotalStock() -> [Beverage:Int] {
        return beverages.reportKindWithCount()
    }
    
    func reportExpiratedBeverage() -> [Beverage] {
        return beverages.reportExpiratedBeverage()
    }

    func verifyHotBeverages() -> [Beverage] {
       return beverages.verifyHotBeverages()
    }
    
    func reportPurchasedHistory() -> [Beverage] {
        return purchasedList
    }
    
}
