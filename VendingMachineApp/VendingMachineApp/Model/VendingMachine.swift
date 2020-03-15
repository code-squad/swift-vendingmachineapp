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
    private var purchasedList: [Beverage] {
        didSet {
            
        }
    }
    var products: [Beverage]
    var bananaMilk = BananMilk(manufacturer: "연세우유", brand: "곰곰", capacity: 200, price: Money(balance: 1200), name: "곰곰 바나나우유", manufacturedDate: Date(), expirationDate: Date(), fatRatio: .original, isLactoFree: false, temperature: 8, bananaCountry: "케냐")
    var chocoMilk = ChocoMilk(manufacturer: "덴마크우유", brand: "덴마크우유", capacity: 300, price: Money(balance: 1600), name: "초코초코우유", manufacturedDate: Date(), expirationDate: Date(), fatRatio: .lower, isLactoFree: false, temperature: 8, chocolateRatio: 30.0)
    var strawberryMilk = StrawberryMilk(manufacturer: "덴마크우유", brand: "덴마크우유", capacity: 300, price: Money(balance: 1600), name: "딸기딸기우유", manufacturedDate: Date(), expirationDate: Date(), fatRatio: .free, temperature: 8, strawberryConcentrateRatio: 20)
    var americano = Americano(manufacturer: "맥심", brand: "티오피", capacity: 255, price: Money(balance: 1400), name: "스위트 아메리카노", manufacturedDate: Date(), expirationDate: Date(), package: .can, temperature: 70, coffeeBean: "에티오피아")
    var latte = Latte(manufacturer: "매일유업", brand: "마이카페라떼", capacity: 200, price: Money(balance: 1400), name: "마이카페라떼 마일드", manufacturedDate: Date(), expirationDate: Date(), package: .plastic, temperature: 8, sugarAmount: 15)
    var mocha = Mocha(manufacturer: "동서식품", brand: "스타벅스", capacity: 300, price: Money(balance: 2200), name: "스타벅스 프라푸치노 모카", manufacturedDate: Date(), expirationDate: Date(), package: .glass, temperature: 8, wheepCreamAmount: 30)
    var coke = Coke(manufacturer: "코카콜라", brand: "코카콜라", capacity: 355, price: Money(balance: 1800), name: "코카콜라", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .original, temperature: 8, cocaLeafRatio: 10.0)
    var cider = Cider(manufacturer: "코카콜라", brand: "스프라이트", capacity: 355, price: Money(balance: 1800), name: "스프라이트", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .lower, temperature: 8, flavor: .lemon)
    var milkis = Milkis(manufacturer: "롯데", brand: "밀키스", capacity: 355, price: Money(balance: 1400), name: "밀키스", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .original, temperature: 4, milkRatio: 20.0)
    
    let beveragesString = "beverages"
    let balanceString = "balance"
    let purchasedListString = "purchasedList"
    let productsString = "products"
    
    let bananaMilkString = "bananaMilk"
    let chocoMilkString = "chocoMilk"
    let strawberryMilkString = "strawberryMilk"
    
    let americanoString = "americano"
    let latteString = "latte"
    let mochaString = "mocha"
    
    let cokeString = "coke"
    let ciderString = "cider"
    let milkisString = "milkis"
    
    
    
    override init() {
        beverages = Beverages()
        balance = Money()
        purchasedList = []
        self.products = [bananaMilk, chocoMilk, strawberryMilk, americano, latte, mocha, coke, cider, milkis]
    }
    
    required init?(coder: NSCoder) {
        let beverages = coder.decodeObject(forKey: beveragesString) as? Beverages
        let balance = coder.decodeObject(forKey: balanceString) as? Money
        let purchasedList = coder.decodeObject(forKey: purchasedListString) as? [Beverage]
        let products = coder.decodeObject(forKey: productsString) as? [Beverage]
        
        let bananaMilk = coder.decodeObject(forKey: bananaMilkString) as? BananMilk
        let chocoMilk = coder.decodeObject(forKey: chocoMilkString) as? ChocoMilk
        let strawberryMilk = coder.decodeObject(forKey: strawberryMilkString) as? StrawberryMilk
        
        let americano = coder.decodeObject(forKey: americanoString) as? Americano
        let latte = coder.decodeObject(forKey: latteString) as? Latte
        let mocha = coder.decodeObject(forKey: mochaString) as? Mocha
        
        let coke = coder.decodeObject(forKey: cokeString) as? Coke
        let cider = coder.decodeObject(forKey: ciderString) as? Cider
        let milkis = coder.decodeObject(forKey: milkisString) as? Milkis
        
        self.beverages = beverages ?? Beverages()
        self.balance = balance ?? Money()
        self.purchasedList = purchasedList ?? []
        self.products = products ?? []
        
        self.bananaMilk = bananaMilk ?? BananMilk()
        self.chocoMilk = chocoMilk ?? ChocoMilk()
        self.strawberryMilk = strawberryMilk ?? StrawberryMilk()
        
        self.americano = americano ?? Americano()
        self.latte = latte ?? Latte()
        self.mocha = mocha ?? Mocha()
        
        self.coke = coke ?? Coke()
        self.cider = cider ?? Cider()
        self.milkis = milkis ?? Milkis()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.beverages, forKey: beveragesString)
        coder.encode(self.balance, forKey: balanceString)
        coder.encode(self.purchasedList, forKey: purchasedListString)
        coder.encode(self.products, forKey: productsString)
        
        coder.encode(self.bananaMilk, forKey: bananaMilkString)
        coder.encode(self.chocoMilk, forKey: chocoMilkString)
        coder.encode(self.strawberryMilk, forKey: strawberryMilkString)
        
        coder.encode(self.americano, forKey: americanoString)
        coder.encode(self.latte, forKey: latteString)
        coder.encode(self.mocha, forKey: mochaString)
        
        coder.encode(self.coke, forKey: cokeString)
        coder.encode(self.cider, forKey: ciderString)
        coder.encode(self.milkis, forKey: milkisString)
    }
    
    func showTotalStock() {
        beverages.forEachBeverages { print($0.description) }
    }
    
    func raiseMoney(moneyUnit: Money.MoneyUnit) {
        balance.raiseMoney(moneyUnit: moneyUnit)
    }
    
    func addStock(_ beverage: Beverage) {
        beverages.addBeverage(beverage)
       postNotificationChangeStock(beverage)
    }
    
    func reportAvailableBeverageNowMoney() -> [Beverage] {
        return beverages.reportAvailableBeverageNowMoney(confirmBalance())
    }
    
    func purchaseBeverage(_ beverage: Beverage) {
        balance.subtract(beverage.price)
        beverages.removeBeverage(beverage)
        purchasedList.append(beverage)
        
        postNotificationChangeStock(beverage)
        postNotificationChangePurchaseList(beverage)
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
    
    func reportProductIndex(_ beverage: Beverage) -> Int? {
        return products.firstIndex(of: beverage)
    }
    
    func postNotificationChangeStock(_ beverage: Beverage) {
        let beverageSequence = reportProductIndex(beverage)
        let beverageCount = beverages.reportBeverageCount(beverage)
        NotificationCenter.default.post(name: .beverageCountChanged, object: nil, userInfo: ["bevSeqeunceCount":(beverageSequence, beverageCount)])
    }
    
    func postNotificationChangePurchaseList(_ beverage: Beverage) {
        let beverageSequence = reportProductIndex(beverage)

        NotificationCenter.default.post(name: .purchasedListChanged, object: nil, userInfo: ["beverageNSequence" : (beverageSequence, purchasedList.count)])
    }
}
