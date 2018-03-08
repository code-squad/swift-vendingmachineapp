//
//  Soda.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private var saccharide: Int = 27
    override init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "탄산"
    }
    override var description: String {
        return " - \(super.description)"
    }
    
    func isSweet() -> Bool {
        return (self.saccharide > 25)
    }
    
    func isModerateSaccharide() -> Bool {
        return saccharide == 27
    }

}
