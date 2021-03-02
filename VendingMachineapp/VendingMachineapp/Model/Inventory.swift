//
//  Inventory.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/25.
//

import Foundation

class Inventory {
    
    private var inventory: [Beverage] = []
    
    func addBeverage(beverage: Beverage) {
        inventory.append(beverage)
    }
    
    func subtractBeverage(beverage: Beverage) -> Beverage? {
        return inventory.remove(at: searchBeverage(beverage: beverage)!)
    }
    
    func searchBeverage(beverage: Beverage) -> Int? {
        if let index = inventory.firstIndex(of: beverage) {
            return index
        } else {
            return nil
        }
    }
    
    func eachBeverage(handler: (Beverage) -> ()) {
        inventory.forEach({ (beverage) in
            handler(beverage)
        })
    }
    
    func wholeBeverage() -> [Beverage:Int] {
        let list = inventory.map({$0}).reduce(into: [:]) { counts, name in
            counts[name, default: 0] += 1
        }
        return list
    }
}
