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
        var stockList: [Beverage : Int] = [:]
        beverages.forEach { (beverage) in
            if let value = stockList[beverage] {
                stockList[beverage] = value + 1
            } else {
                stockList[beverage] = 1
            }
        }
        return stockList
    }
}
