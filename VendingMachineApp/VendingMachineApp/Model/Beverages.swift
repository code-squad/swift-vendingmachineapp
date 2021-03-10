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
        var result = [ObjectIdentifier: [Beverage]]()
        beverages.forEach { (beverage) in
            if result[ObjectIdentifier(beverage.self)] == nil {
                result[ObjectIdentifier(beverage.self)] = [beverage]
            }else{
                result[ObjectIdentifier(beverage.self)]?.append(beverage)
            }
        }
        return result
    }
}

extension Beverages: Equatable {
    static func == (lhs: Beverages, rhs: Beverages) -> Bool{
        return lhs.beverages == rhs.beverages
    }
}
