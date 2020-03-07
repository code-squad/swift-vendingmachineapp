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
    private(set) var balance: Int
    private var purchaseHistory: Beverages
    private let beverageFactory: BeverageFactory
    
    enum BeverageNumbers: Int, CaseIterable {
        case ChocolateMilk, StrawberryMilk, Coke, Cider, Georgia, TOP
        
        func getValue() -> Int {
            return self.rawValue
        }
    }
    
    init() {
        self.beverages = Beverages()
        self.balance = 0
        self.purchaseHistory = Beverages()
        self.beverageFactory = BeverageFactory()
    }
    
    func insert(beverageNumber: BeverageNumbers) {
        beverages.add(beverage: beverageFactory.makeBeverage(number: beverageNumber))
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
        self.balance += balance
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
    
    func purchase(beverage: Beverage) {
        balance -= beverage.getPrice()
        purchaseHistory.add(beverage: beverage)
        beverages.remove(beverage: beverage)
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
