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
    
    public func compactMap(_ transform: (Beverage) throws -> Beverage?) rethrows -> [Beverage] {
        var result: [Beverage] = []
        for item in products.keys {
            if let item = try transform(item) {
                result.append(item)
            }
        }
        return result
    }
    
    public mutating func update(value: Int, forkey key: Beverage) {
        products.updateValue(value, forKey: key)
    }
}


