//
//  Top.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Top: Coffee {
    private var isHotDrink: Bool = false
    convenience init() {
        self.init(brand: "", weight: 0, price: 0, name: "", manufactureDate: Date(), isHotDrink: true)
    }
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, isHotDrink: Bool) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "TOP"
    }
    required init?(coder aDecoder: NSCoder) {
        isHotDrink = aDecoder.decodeBool(forKey: "isHotDrink")
        super.init(coder: aDecoder)
    }
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(isHotDrink, forKey: "isHotDrink")
    }
    
    func isColdDrink() -> Bool {
        return !self.isHotDrink
    }
}
