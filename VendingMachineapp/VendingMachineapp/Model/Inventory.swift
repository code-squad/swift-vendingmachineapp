//
//  Inventory.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/25.
//

import Foundation

class Inventory {
    
    private var inventory: [Beverage] = []
    private var purchaseList: [Beverage] = []
    private var purchaseHistory: [Beverage] = []
    
    func addBeverage(beverage: Beverage) {
        inventory.append(beverage)
    }
    
    func subtractBeverage(beverage: Beverage) {
        purchaseHistory.append( inventory.remove(at: searchBeverage(beverage: beverage)!) )
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
    
    func availablePurchaseList(money: Int) -> [Beverage] {
        purchaseList.removeAll()
        
        eachBeverage(handler: { (beverage) in
            if beverage.isAvailablePurchase(with: money) {
                if !purchaseList.contains(beverage) {
                    purchaseList.append(beverage)
                }
            }
        })
        return purchaseList
    }
    
    func purchasedList() -> [Beverage] {
        return purchaseHistory
    }
    
    func hotBeverageList() -> [Beverage] {
        var list: [Beverage] = []
        eachBeverage(handler: { (beverage) in
            if beverage.isHot() {
                list.append(beverage)
            }
        })
        return list
    }
    
    func invalidateList(with date: Date) -> [Beverage] {
        var list: [Beverage] = []
        eachBeverage(handler: { (beverage) in
            if !beverage.validate(with: date) {
                list.append(beverage)
            }
        })
        return list
    }
    
    func wholeBeverage() -> [Beverage:Int] {
        let list = inventory.map({$0}).reduce(into: [:]) { counts, name in
            counts[name, default: 0] += 1
        }
        return list
    }
    
}
