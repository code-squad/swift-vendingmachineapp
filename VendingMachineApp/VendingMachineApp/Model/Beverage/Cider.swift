//
//  Cider.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Cider: Soda {
    enum Taste: String, CaseIterable {
        case lemon = "lemon"
        case pear = "pear"
        
        init(index: Int) {
            self = Taste.allCases[index]
        }
    }
    
    private var taste: Taste
    
    init(brand: String, capacity: Capacity, price: Price, name: Name, manufacturingDate: Date, calorie: Calorie, temperature: Temperature, beverageIndex: VendingMachine.BeverageNumbers, taste: Taste) {
        self.taste = taste
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, beverageIndex: beverageIndex)
    }
    
    func isSameTaste(as taste: Taste) -> Bool {
        return self.taste == taste
    }
}
