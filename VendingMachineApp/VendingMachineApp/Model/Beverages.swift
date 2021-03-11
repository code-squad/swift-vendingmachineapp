//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/03.
//

import Foundation

class Beverages {
    
    private var beverages: [Beverage]
    
    init() {
        self.beverages = [Beverage]()
    }
    
    func addBeverage(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func retrieveBeverage(completion: (Beverage) -> Void) {
        beverages.forEach{(
            completion($0)
        )}
    }
    
    func removeBeverage(beverage: Beverage) -> Beverage {
        let beverageIndex = beverages.firstIndex(of: beverage) ?? -1
        return beverages.remove(at: beverageIndex)
    }
    
    func checkBeverageStock() -> [ObjectIdentifier: [Beverage]] {
        var stock = [ObjectIdentifier: [Beverage]]()
        beverages.forEach { (beverage) in
            if stock[ObjectIdentifier(type(of: beverage.self))] == nil {
                stock[ObjectIdentifier(type(of: beverage.self))] = [beverage]
            }else{
                stock[ObjectIdentifier(type(of: beverage.self))]?.append(beverage)
            }
        }
        return stock
    }
}

extension Beverages: Equatable {
    static func == (lhs: Beverages, rhs: Beverages) -> Bool{
        return lhs.beverages == rhs.beverages
    }
}
