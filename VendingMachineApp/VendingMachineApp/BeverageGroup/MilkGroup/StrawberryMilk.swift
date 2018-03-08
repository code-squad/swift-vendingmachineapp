//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private var strawberrySyrup: Int = 1
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, strawberrySyrup: Int) {
        self.strawberrySyrup = strawberrySyrup
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "딸기우유"
    }
    override var description: String {
        return "\(self.kindOf)(\(type(of: self)))\(super.description)"
    }
    
    func quantityOfstrawberrySyrup() -> Int {
        return strawberrySyrup
    }
    func isModerateSyrup() -> Bool {
        return strawberrySyrup == 5
    }
}
