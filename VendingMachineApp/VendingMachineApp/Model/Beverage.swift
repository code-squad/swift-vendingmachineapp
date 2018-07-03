//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    private let name: String
    private let price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    convenience init() {
        self.init(name: DefaultData.beverage.name, price: DefaultData.beverage.price)
    }
    
    var description: String {
        return "\(self.name)"
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name && rhs.price == rhs.price
    }
}
