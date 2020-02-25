//
//  Stock.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Stock {
    var beverages = [Beverage]()
    
    func add(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func serve(beverageName: String) -> Beverage {
        return beverages.remove(at: beverages.firstIndex(where: { $0.name == beverageName })!)
    }
    
    func printAll() {
        beverages.forEach {
            print($0)
        }
    }
    
    func getPurchasableList(money: Int) -> [Beverage] {
        return beverages.filter { money >= $0.price }
    }
    
    func sortOut() -> [Beverage:Int] {
        let list = beverages.reduce(into: [Beverage:Int]()) {
            if $0[$1] == nil {
                $0[$1] = 1
            } else {
                $0[$1]! += 1
            }
        }
        return list
    }
    
    func getDateExpiredBeverages() -> [Beverage] {
        return beverages.filter { !$0.validate(with: Date()) }
    }
    
    func getHotBeverages() -> [Beverage] {
        return beverages.filter { $0.isHot }
    }
}
