//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class VendingMachine: NSObject, NSCoding{
    enum Property: String, CustomStringConvertible {
        case beverages
        case balance
        case purchaseHistory
        
        var description: String {
            return self.rawValue
        }
    }
    func encode(with coder: NSCoder) {
        coder.encode(beverages, forKey: "\(Property.beverages)")
        coder.encode(balance, forKey: "\(Property.balance)")
        coder.encode(purchaseHistory, forKey: "\(Property.purchaseHistory)")
    }
    
    required init?(coder decoder: NSCoder) {
        if let beverages = decoder.decodeObject(forKey: "\(Property.beverages)") as? Beverages {
            self.beverages = beverages
        } else {
            self.beverages = Beverages()
        }
            
        if let balance = decoder.decodeObject(forKey: "\(Property.balance)") as? Price {
            self.balance = balance
        } else {
            self.balance = Price(0)
        }
        
        if let purchaseHistory = decoder.decodeObject(forKey: "\(Property.purchaseHistory)") as? Beverages {
            self.purchaseHistory = purchaseHistory
        } else {
            self.purchaseHistory = Beverages()
        }
    }
    
    private var beverages: Beverages
    private(set) var balance: Price
    private var purchaseHistory: Beverages
    
    static let beverageList = [
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
    
    override init() {
        self.beverages = Beverages()
        self.balance = Price(0)
        self.purchaseHistory = Beverages()
    }
    
    func insert(beverageNumber: Int) {
        beverages.add(beverage: VendingMachine.beverageList[beverageNumber])
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
        self.balance.add(money: Price.KindOfMoney.allCases[moneyNumber])
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
        balance.minus(money: VendingMachine.beverageList[beverageNumber].price)
        purchaseHistory.add(beverage: VendingMachine.beverageList[beverageNumber])
        beverages.remove(beverage: VendingMachine.beverageList[beverageNumber])
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
