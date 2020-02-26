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
    private var balance: Int
    
    init() {
        self.beverages = Beverages()
        self.balance = 0
    }
    
    func insertBeverage(beverage: Beverage) {
        beverages.addBeverage(beverage: beverage)
    }
    
    func forEachBeverages(_ transfrom: (Beverage) -> ()) {
        beverages.forEachBeverages{
            transfrom($0)
        }
    }
    
    func addBalance(balance: Int) {
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
        beverages.removeBeverage(beverage: beverage)
    }
    
    func getBalance() -> Int {
        return balance
    }
    
    func getDictionary() -> [String : Int] {
        return beverages.getDictionary()
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
}
