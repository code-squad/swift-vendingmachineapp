//
//  Coffee.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var caffeineContent: Int = 76
    override init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "커피"
    }
    override var description: String {
        return " - \(super.description)"
    }
    
    var descriptionDetail: String {
        return "\(self.kindOf)(\(type(of: self)))\(super.description)"
    }
    
    func isRichCaffeine() -> Bool {
        return self.caffeineContent > 70
    }
    
    func isModerateCaffeine() -> Bool {
        return caffeineContent == 76
    }
}
