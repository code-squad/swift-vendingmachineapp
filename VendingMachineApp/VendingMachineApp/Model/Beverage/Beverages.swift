//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by delma on 03/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Beverages {
    private var beverages: [Beverage]
    
    init() {
        beverages = [Beverage]()
    }
    
    func forEachBeverages(_ handler: (Beverage) -> ()) {
        beverages.forEach { handler($0) }
    }
    
    func addBeverage(_ beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func verifyHotBeverages() -> [Beverage] {
       return beverages.filter { $0.verifyHotBeverage() }
    }
 
    func removeBeverage(_ beverage: Beverage) {
        beverages.firstIndex(of: beverage).map { beverages.remove(at: $0) }
    }
    
    func reportKindWithCount() -> [Beverage : Int] {
       return beverages.reduce(into: [Beverage : Int]()) { (stockList, beverage) in
            stockList[beverage] = beverages.filter({ $0 == beverage }).count
        }
    }
    
    func reportExpiratedBeverage() -> [Beverage] {
        return beverages.filter{ $0.isExpiratedBeverage() }
    }
    
    func reportAvailableBeverageNowMoney(_ balance: Money) -> [Beverage] {
        beverages.filter { $0.price < balance }
    }
    
    func reportBeverageCount(_ beverage: Beverage) -> Int {
        return beverages.filter { $0 == beverage
        }.count
    }
}
