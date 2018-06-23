//
//  Stock.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Stock {
    
    private var beverages: [Beverage]
    
    init(_ beverages: [Beverage]) {
        self.beverages = beverages
    }
    
    convenience init() {
        self.init([Beverage]())
    }
    
    var beverageType: Beverage.Type {
        return self.beverages.type
    }
}

extension Stock: Equatable {
    static func == (lhs: Stock, rhs: Stock) -> Bool {
        return lhs.beverages == rhs.beverages
    }
}

extension Array where Element == Beverage {
    var type: Element.Type {
        return Element.self
    }
}
