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
                      calorie: 195.0,
                      temperature: .Cool,
                      farmCode: Milk.FarmCode(),
                      package: .paper),
        StrawberryMilk(brand: "SeoulMilk",
                       capacity: 300,
                       price: Price(1000),
                       name: "StrawberryMilk",
                       manufacturingDate: Date(),
                       calorie: 195.0,
                       farmCode: Milk.FarmCode(),
                       temperature: .Cool,
                       juiceContent: 2.0),
        Coke(brand: "CocaCola",
             capacity: 355,
             price: Price(2000),
             name: "Coke",
             manufacturingDate: Date(),
             calorie: 160.0,
             temperature: .Cool,
             carbonicAcid: 20.0),
        Cider(brand: "CocaCola",
              capacity: 355,
              price: Price(2000),
              name: "Cider",
              manufacturingDate: Date(),
              calorie: 168.0,
              temperature: .Cool,
              taste: Cider.Taste.lemon),
        Georgia(brand: "CocaCola",
                capacity: 240,
                price: Price(1500),
                name: "GeorGia",
                manufacturingDate: Date(),
                calorie: 94.0,
                temperature: .Hot,
                decaffeinated: false,
                black: false),
        TOP(brand: "Maxim",
            capacity: 275,
            price: Price(2000),
            name: "TOP",
            manufacturingDate: Date(),
            calorie: 48.0,
            temperature: .Hot,
            decaffeinated: false,
            beanOrigin: TOP.BeanOrigin())
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
    
    func add(moneyNumber: Int) {
        self.balance.add(moneyNumber: moneyNumber)
        NotificationCenter.default.post(name: Notification.Name.updateBalance,
                                        object: nil,
                                        userInfo: ["balance": self.balance])
    }
    
    func purchasableBeverages() -> [String] {
        var beverageList = [String]()
        beverages.forEachBeverages{
            if $0.canBuy(have: balance) {
                beverageList.append("\($0)")
            }
        }
        
        return beverageList
    }
    
    func purchase(beverageNumber: Int) {
        balance.minus(money: beverageList[beverageNumber].price)
        purchaseHistory.add(beverage: beverageList[beverageNumber])
        beverages.remove(beverage: beverageList[beverageNumber])
        NotificationCenter.default.post(name: Notification.Name.updateBalance,
                                        object: nil,
                                        userInfo: ["balance": self.balance])
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
            if $0.isHot() {
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
