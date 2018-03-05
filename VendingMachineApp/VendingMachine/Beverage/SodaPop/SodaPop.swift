//
//  SodaPop.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class SodaPop: Beverage {
    private var lowCalorie: Bool

    init(brand: String, name: String, volume: Int, price: Int, manufacturedDate: Date, lowCalorie: Bool) {
        self.lowCalorie = lowCalorie
        super.init(brand: brand, name: name, volume: volume, price: price, manufacturedDate: manufacturedDate)
    }

    func isLowCalorie() -> Bool {
        return self.lowCalorie
    }

    static func getKind() -> ObjectIdentifier {
        return ObjectIdentifier(self)
    }
}
