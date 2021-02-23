//
//  BeverageStorage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class BeverageStorage {
    private var stock: [(bev: Beverage, amt: Int)]
    
    init() {
        stock = []
    }
    
    public func addStock(with beverage: Beverage, amount: Int) {
        let relevantIndex = stock.firstIndex { (tuple) -> Bool in
            tuple.bev.isSameBeverage(with: beverage)
        }
        
        if relevantIndex != nil {
            let remainingAmount = stock[relevantIndex!].amt
            stock.remove(at: relevantIndex!)
            stock.append((bev: beverage, amt: amount + remainingAmount))
        } else {
            stock.append((bev: beverage, amt: amount))
        }
    }

    public func showPurchasableBeverage(with money: Int) -> String {
        var result: String = ""
        stock.forEach { (item) in
            guard item.bev.isPurchasable(with: money) else {return}
            result.append("\(item.bev), 남은수량: \(item.amt)\n")
        }
        return result
    }
}

extension BeverageStorage: CustomStringConvertible {
    var description: String {
        var result: String = ""
        stock.forEach { (item) in
            result.append("\(item.bev), 남은수량: \(item.amt)\n")
        }
        return result
    }
}
