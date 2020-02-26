//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Beverages {
    private var beverages: [Beverage]
    
    init() {
        beverages = [Beverage]()
    }
    
    func addBeverage(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func forEachBeverages(_ transform: (Beverage) -> ()) {
        beverages.forEach {
            transform($0)
        }
    }
    
    func removeBeverage(beverage: Beverage) {
        for beverageIndex in 0 ..< beverages.count {
            if beverages[beverageIndex] == beverage {
                beverages.remove(at: beverageIndex)
                break
            }
        }
    }
    
    func getDictionary() -> [String : Int] {
        var beverageDic = [String : Int]()
        beverages.forEach{
            let beverage = $0
            beverageDic["\(beverage)"] = beverages.filter{beverage == $0}.count
        }
        
        return beverageDic
    }
}
