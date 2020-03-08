//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class VendingMachine{
    private var beverages: Beverages
    private(set) var balance: Price
    private var purchaseHistory: Beverages
    
    let beverageList = [
        ChocolateMilk(brand: "SeoulMilk",
                      capacity: 300,
                      price: Price(1000),
                      name: "ChocolateMilk",
                      manufacturingDate: Date(),
                      calorie: 195,
                      temperature: 10,
                      farmCode: Milk.FarmCode(index: Int.random(in: 0..<Milk.FarmCode.allCases.count)),
                      package: .paper),
        StrawberryMilk(brand: "SeoulMilk",
                       capacity: 300,
                       price: Price(1000),
                       name: "StrawberryMilk",
                       manufacturingDate: Date(),
                       calorie: 195,
                       farmCode: Milk.FarmCode(index: Int.random(in: 0..<Milk.FarmCode.allCases.count)),
                       temperature: 10,
                       juiceContent: 2),
        Coke(brand: "CocaCola",
             capacity: 355,
             price: Price(2000),
             name: "Coke",
             manufacturingDate: Date(),
             calorie: 160,
             temperature: 10,
             carbonicAcid: 20),
        Cider(brand: "CocaCola",
              capacity: 355,
              price: Price(2000),
              name: "Cider",
              manufacturingDate: Date(),
              calorie: 168,
              temperature: 10,
              taste: Cider.Taste(index: Int.random(in: 0..<Cider.Taste.allCases.count))),
        Georgia(brand: "CocaCola",
                capacity: 240,
                price: Price(1500),
                name: "GeorGia",
                manufacturingDate: Date(),
                calorie: 94,
                temperature: 65,
                decaffeinated: false,
                black: false),
        TOP(brand: "Maxim",
            capacity: 275,
            price: Price(2000),
            name: "TOP",
            manufacturingDate: Date(),
            calorie: 48,
            temperature: 65,
            decaffeinated: false,
            beanOrigin: TOP.BeanOrigin.init(index: Int.random(in: 0..<TOP.BeanOrigin.allCases.count)))
    ]
    
    init() {
        self.beverages = Beverages()
        self.balance = Price(0)
        self.purchaseHistory = Beverages()
    }
    
    func insert(beverageNumber: Int) {
        beverages.add(beverage: beverageList[beverageNumber])
    }
    
    func forEachBeverages(_ transfrom: (Beverage) -> ()) {
        beverages.forEachBeverages{
            transfrom($0)
        }
    }
    
    func forEachPurchasedHistory(_ transfrom: (Beverage) -> ()) {
        purchaseHistory.forEachBeverages{
            transfrom($0)
        }
    }
    
    func add(balance: Int) {
        self.balance.add(money: balance)
        NotificationCenter.default.post(name: Notification.Name.updateBalance,
                                        object: nil,
                                        userInfo: ["balance": self.balance.money])
    }
    
    func purchasableBeverages() -> [String] {
        var beverageList = [String]()
        beverages.forEachBeverages{
            if $0.canBuy(have: balance.money) {
                beverageList.append("\($0)")
            }
        }
        
        return beverageList
    }
    
    func purchase(beverageNumber: Int) {
        balance.add(money: -beverageList[beverageNumber].price.money)
        purchaseHistory.add(beverage: beverageList[beverageNumber])
        beverages.remove(beverage: beverageList[beverageNumber])
        NotificationCenter.default.post(name: Notification.Name.updateBalance,
                                        object: nil,
                                        userInfo: ["balance": self.balance.money])
    }
    
    func kindOfBeverages() -> [String : Int] {
        return beverages.kindOfBeverages()
    }
    
    func expiredBeverages() -> [String] {
        var expired = [String]()
        beverages.forEachBeverages {
            if $0.isSafe() != false {
                expired.append("\($0)")
            }
        }
        
        return expired
    }
    
    func hotBeverages() -> [String] {
        var hot = [String]()
        beverages.forEachBeverages {
            if $0.isHot(standard: 65) {
                hot.append("\($0)")
            }
        }
        
        return hot
    }
    
    func purchasedBeverages() -> [String] {
        var purchased = [String]()
        purchaseHistory.forEachBeverages {
            purchased.append("\($0)")
        }
        
        return purchased
    }
}

extension Notification.Name {
    static let updateBalance = Notification.Name("UpdateBalance")
}
