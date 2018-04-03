//
//  Shelf.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 3. 6..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Shelf: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {

    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }

    private(set) var itemTags = [ObjectIdentifier]()

    override init() {
        self.itemTags = [BananaMilk.self,
                         ChocoMilk.self,
                         Coffee.self,
                         DolceLatte.self,
                         EnergyDrink.self,
                         SoftDrink.self].map({ ObjectIdentifier($0) })
    }

    init(items: [ObjectIdentifier: [Beverage]]) {
        var newDict = items

        let keysToRemove = newDict.keys.filter {
            guard let value = newDict[$0] else { return false }
            return value.count == 0
        }
        for key in keysToRemove {
            newDict.removeValue(forKey: key)
        }

        self.itemTags = Array(newDict.keys)
    }

    func update(newItems: [ObjectIdentifier: [Beverage]]) -> Shelf {
        return Shelf()
    }

    func matchCode(option: Int) throws -> ObjectIdentifier {
        guard 0..<itemTags.count ~= option else {
            throw Exception.outOfStock
        }
        let result = self.itemTags[option]
        return result
    }

}
