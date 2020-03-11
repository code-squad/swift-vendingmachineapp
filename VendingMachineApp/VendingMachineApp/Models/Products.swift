//
//  Products.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/11.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Products {
    
    private var products: [Beverage: Int] = [: ]
    public var count: Int {
        products.count
    }
    
    public subscript(index: Beverage) -> Int? {
        get {
            products[index] ?? nil
        }
    }
    
    public func forEach(_ transform: (Beverage, Int) -> Void) {
        products.forEach { key, value in
            transform(key, value)
        }
    }
    
    public mutating func update(value: Int, forkey key: Beverage) {
        products.updateValue(value, forKey: key)
    }
}


