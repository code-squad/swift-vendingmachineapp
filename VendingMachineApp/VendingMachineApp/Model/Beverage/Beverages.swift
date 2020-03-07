//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Beverages {
    enum KindOfBeverages: Int {
        case ChocolateMilk, StrawberryMilk, Coke, Cider, GeorGia, TOP
    }
    
    private var beverages: [Beverage]
    
    init() {
        beverages = [Beverage]()
    }
    
    func add(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func forEachBeverages(_ transform: (Beverage) -> ()) {
        beverages.forEach {
            transform($0)
        }
    }
    
    func remove(beverage: Beverage) {
        for beverageIndex in 0 ..< beverages.count {
            if beverages[beverageIndex] == beverage {
                beverages.remove(at: beverageIndex)
                break
            }
        }
    }
    
    func kindOfBeverages() -> [String : Int] {
        let result = beverages.reduce(into: [String : Int]()) { (result, key) in
            result["\(key)"] = beverages.filter{key == $0}.count
        }
        return result
    }
}
