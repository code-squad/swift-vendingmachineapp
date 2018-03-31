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

    required init?(coder aDecoder: NSCoder) {
        self.itemTags = [
            ObjectIdentifier(type(of: BananaMilk())),
            ObjectIdentifier(type(of: ChocoMilk())),
            ObjectIdentifier(type(of: Coffee())),
            ObjectIdentifier(type(of: DolceLatte())),
            ObjectIdentifier(type(of: EnergyDrink())),
            ObjectIdentifier(type(of: SoftDrink()))
        ]
    }

    private(set) var itemTags = [ObjectIdentifier]()

    override init() {
        self.itemTags = [
            ObjectIdentifier(type(of: BananaMilk())),
            ObjectIdentifier(type(of: ChocoMilk())),
            ObjectIdentifier(type(of: Coffee())),
            ObjectIdentifier(type(of: DolceLatte())),
            ObjectIdentifier(type(of: EnergyDrink())),
            ObjectIdentifier(type(of: SoftDrink()))
        ]
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
        return Shelf(items: newItems)
    }

    func matchCode(option: Int) throws -> ObjectIdentifier {
        guard option < itemTags.count else {
            throw Exception.outOfStock
        }
        guard option > -1 else {
            throw Exception.outOfStock
        }
        let result = self.itemTags[option]
        return result
    }

}
