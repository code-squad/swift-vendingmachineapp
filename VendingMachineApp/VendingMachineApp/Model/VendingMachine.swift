//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by delma on 29/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
struct VendingMachine {
    private var beverages: Beverages
    private(set) var balance: Money = Money()
    private var purchasedList: [Beverage] = []
    let bananaMilk = BananMilk(manufacturer: "연세우유", brand: "곰곰", capacity: 200, price: Money(balance: 1200), name: "곰곰 바나나우유", manufacturedDate: Date(), expirationDate: Date(), fatRatio: .original, isLactoFree: false, temperature: 8, bananaCountry: "케냐")
    let chocoMilk = ChocoMilk(manufacturer: "덴마크우유", brand: "덴마크우유", capacity: 300, price: Money(balance: 1600), name: "초코초코우유", manufacturedDate: Date(), expirationDate: Date(), fatRatio: .lower, isLactoFree: false, temperature: 8, chocolateRatio: 30.0)
    let strawberryMilk = StrawberryMilk(manufacturer: "덴마크우유", brand: "덴마크우유", capacity: 300, price: Money(balance: 1600), name: "딸기딸기우유", manufacturedDate: Date(), expirationDate: Date(), fatRatio: .free, temperature: 8, isLactoFree: true)
    let americano = Americano(manufacturer: "맥심", brand: "티오피", capacity: 255, price: Money(balance: 1400), name: "스위트 아메리카노", manufacturedDate: Date(), expirationDate: Date(), isContainMilk: false, package: .can, temperature: 70, coffeeBean: "에티오피아")
    let latte = Latte(manufacturer: "매일유업", brand: "마이카페라떼", capacity: 200, price: Money(balance: 1400), name: "마이카페라떼 마일드", manufacturedDate: Date(), expirationDate: Date(), isContainMilk: true, package: .plastic, temperature: 8, isContainSugar: true)
    let mocha = Mocha(manufacturer: "동서식품", brand: "스타벅스", capacity: 300, price: Money(balance: 2200), name: "스타벅스 프라푸치노 모카", manufacturedDate: Date(), expirationDate: Date(), isContainMilk: true, package: .glass, temperature: 8, isContainWheepCream: true)
    let coke = Coke(manufacturer: "코카콜라", brand: "코카콜라", capacity: 355, price: Money(balance: 1800), name: "코카콜라", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .original, temperature: 8, cocaLeafRatio: 10.0)
    let cider = Cider(manufacturer: "코카콜라", brand: "스프라이트", capacity: 355, price: Money(balance: 1800), name: "스프라이트", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .lower, temperature: 8, flavor: .lemon)
    let milkis = Milkis(manufacturer: "롯데", brand: "밀키스", capacity: 355, price: Money(balance: 1400), name: "밀키스", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .original, temperature: 4, milkRatio: 20.0)
    lazy var products: [Beverage] = [bananaMilk, chocoMilk, strawberryMilk, americano, latte, mocha, coke, cider, milkis]
    let currency = [5000, 1000, 500, 100]
    
    init() {
        beverages = Beverages()
    }
    
    func showTotalStock() {
        beverages.forEachBeverages { print($0.description) }
    }
    
    mutating func raiseMoney(index: Int) {
        balance.raiseMoney(index: index)
    }

    mutating func addStock(_ index: Int) {
        beverages.addBeverage(products[index])
    }

    mutating func reportAvailableBeverageNowMoney() -> [Beverage] {
        return beverages.reportAvailableBeverageNowMoney(confirmBalance())
    }

    mutating func purchaseBeverage(index: Int) {
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
