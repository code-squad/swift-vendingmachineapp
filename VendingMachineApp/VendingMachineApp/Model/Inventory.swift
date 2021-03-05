//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/06.
//

import Foundation

class Inventory : Equatable {
    private var stocks: [Beverage]
    
    init() {
        self.stocks = [Beverage]()
    }
    
    public static func == (lhs: Inventory, rhs: Inventory) -> Bool{
        return lhs === rhs
    }
    
    func append(item: Beverage) {
        stocks.append(item)
    }
    
    func remove(item: Beverage) {
        stocks.removeFirst()
    }
    
    func getStockList() -> [Beverage : Int] {
        let list = stocks.toDictionary{ $0 }
        return list.mapValues{ $0.count }
    }
    
    func expiredItems() -> [Beverage] {
        let expired = stocks.filter{$0.isExpired(current: Date())}
        return expired
    }
    
    func lowCaffeineItems() -> [Beverage] {
        var lowCaffeine = [Beverage]()
        
        stocks.forEach { item in
            if let coffee = item as? Coffee {
                if coffee.isLowCaffeine() { lowCaffeine.append(coffee) }
            }
        }
        return lowCaffeine
    }
    
}
