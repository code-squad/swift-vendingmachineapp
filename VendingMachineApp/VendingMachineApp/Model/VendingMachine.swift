//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var stock = Stock()
    private var money = Money()
    private(set) var purchaseHistory = [Beverage]()
    var purchasableList: [Beverage] {
        stock.getPurchasableList(money: money)
    }
    var stockList: [(key: Beverage, value: Int)] {
        stock.sortOut().sorted {
            $0.key.name < $1.key.name
        }
    }
    var dateExpiredBeverages: [Beverage] {
        stock.getDateExpiredBeverages()
    }
    var hotBeverages: [Beverage] {
        stock.getHotBeverages()
    }
    
    init() {
        self.stock.add(beverage: StrawberryMilk(brand: "서울우유", amount: 180, price: Money(amount: 800), name: "딸기꿀단지", calorie: 145, saleablePeriod: 70, fatRatio: 9, strawberryContent: 1))
        self.stock.add(beverage: Cola(brand: "코카콜라", amount: 250, price: Money(amount: 1200), name: "코카콜라 제로", calorie: 0, saleablePeriod: 600, sugarContent: 0))
        self.stock.add(beverage: Cantata(brand: "롯데", amount: 500, price: Money(amount: 2500), name: "칸타타 콘트라베이스", calorie: 20, saleablePeriod: 150, caffeineContent: 179, isHot: false))
        self.stock.add(beverage: BananaMilk(brand: "빙그레", amount: 240, price: Money(amount: 1000), name: "바나나맛우유", calorie: 208, saleablePeriod: 90, fatRatio: 15, bananaContent: 3))
        self.stock.add(beverage: Fanta(brand: "코카콜라", amount: 250, price: Money(amount: 1000), name: "환타 오렌지", calorie: 136, saleablePeriod: 600, sugarContent: 34, flavor: "오렌지"))
    }
    
    func addBeverage(beverage: Beverage) {
        stock.add(beverage: beverage)
    }
    
    func checkBalance() -> Money {
        return money
    }
    
    mutating func addBalance(_ money: Money) {
        self.money += money
    }
    
    mutating func buy(beverage: Beverage) -> Beverage? {
        guard purchasableList.contains(beverage) else {
            return nil
        }
        let servedBeverage = stock.serve(beverage: beverage)
        money -= servedBeverage.price
        purchaseHistory.append(servedBeverage)
        return beverage
    }
}
