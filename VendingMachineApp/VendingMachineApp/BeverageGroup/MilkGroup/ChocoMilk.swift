//
//  ChocoMilk.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ChocoMilk: Milk {
    private var cocoaPowder: Double = 1.1
    convenience init() {
        self.init(brand: "", weight: 0, price: 0, name: "", manufactureDate: Date(), cocoaPower: 1)
    }
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, cocoaPower: Double) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "초코우유"
    }
    
    func isDarkChocolate() -> Bool {
        return self.cocoaPowder > 3.0
    }
}
