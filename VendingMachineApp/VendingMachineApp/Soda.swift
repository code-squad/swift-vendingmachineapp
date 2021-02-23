//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Soda: Drink, CustomStringConvertible {
    enum Kind {
        case coke, cider, fanta
    }
    
    private(set) var kind: Kind
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, kind: Kind) {
        self.kind = kind
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price)
    }
}

