//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Drinks: NSObject, NSCoding {
    
    private var drinks: [Beverage]
    
    func encode(with coder: NSCoder) {
        coder.encode(drinks, forKey: "beverages")
    }
    
    required init?(coder: NSCoder) {
        drinks = coder.decodeObject(forKey: "beverages") as! [Beverage]
    }
    
    init(_ drinks: [Beverage]) {
        self.drinks = drinks
    }
    convenience override init() {
        self.init([])
    }
    
    func add(with beverage: Beverage) {
        drinks.append(beverage)
    }
    
    func remove(with beverage: Beverage) -> Beverage {
        let beverageIndex = drinks.firstIndex(of: beverage) ?? -1
        return drinks.remove(at: beverageIndex)
    }

    func showListForPurchase(with cashManagementSystem: CashManagementSystem) -> Drinks {
        return cashManagementSystem.retrieveCash { (cash) in
            return Drinks(drinks.filter{$0.isAvailablePurchase(with: cash)})
        }
                
    }
    
    func giveStockList() -> [ObjectIdentifier : [Beverage]] {
        var result = [ObjectIdentifier : [Beverage]]()
        drinks.forEach { (beverage) in
            if result[ObjectIdentifier(type(of:beverage.self))] == nil {
                result[ObjectIdentifier(type(of:beverage.self))] = [beverage]
            } else {
                result[ObjectIdentifier(type(of:beverage.self))]!.append(beverage)
            }
            
        }
        return result
    }
    
    func giveExpiredList() -> Drinks {
        return Drinks(drinks.filter{$0.isExpired(on: Date())})
    }
    
    func giveHotBeverageList() -> Drinks {
        return Drinks(drinks.filter{$0.isHot(at: 65)})
    }
}



