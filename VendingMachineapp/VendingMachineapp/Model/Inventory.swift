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
    // 더 나은 방법이 없을까..
    func searchBeverage(beverage: Beverage) -> Int? {
        for index in 0..<inventory.count {
            if beverage == inventory[index]{
                return index
            }
        }
        return nil
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
                purchaseList.append(beverage)
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
    
    func validateList(with date: Date) -> [Beverage] {
        var list: [Beverage] = []
        eachBeverage(handler: { (beverage) in
            if beverage.validate(with: date) {
                list.append(beverage)
            }
        })
        return list
    }
    
    func wholeBeverage() -> [String:Int] {
        let list = inventory.map({$0.brand}).reduce(into: [:]) { counts, name in
            counts[name, default: 0] += 1
        }
        return list
    }
    
}
