//
//  Coffee.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var hot: Bool

    init(brand: String, name: String, volume: Int, price: Int, manufacturedDate: Date, hot: Bool) {
        self.hot = hot
        super.init(brand: brand, name: name, volume: volume, price: price, manufacturedDate: manufacturedDate)
    }

    func isHot() -> Bool {
        return self.hot
    }

    static func getKind() -> ObjectIdentifier {
        return ObjectIdentifier(self)
    }

}
