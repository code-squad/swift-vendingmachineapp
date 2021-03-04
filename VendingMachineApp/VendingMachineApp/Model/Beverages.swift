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
    
    func removeBeverage(beverage: Beverage) {
        for beverageIndex in 0 ..< beverages.count {
            if beverages[beverageIndex] == beverage {
                beverages.remove(at: beverageIndex)
                break
            }
        }
    }
    
}

