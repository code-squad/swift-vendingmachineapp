//
//  Products.swift
//  VendingMachine
//
//  Created by jang gukjin on 11/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Array<Product>: Sequence, IteratorProtocol {
    typealias Element = Product

    mutating func next() -> Product? {
        <#code#>
    }

    func makeIterator() -> Array<Product> {
        return Array<Product>(value: self.value)
    }

    static func set() -> [Product] {
        var itemsSet = [Product]()
        for item in self {
            if !itemsSet.contains(item) {
                itemsSet.append(item)
            }
        }
        return itemsSet
    }
}

let array: [Int] = [1, 2, 3]
