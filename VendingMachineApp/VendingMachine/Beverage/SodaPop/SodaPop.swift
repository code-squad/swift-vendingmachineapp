//
//  SodaPop.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class SodaPop: Beverage {
    private var lowCalorie: Bool = false

    init(brand: String, name: String, volume: Int, price: Int, manufacturedDate: Date, lowCalorie: Bool) {
        self.lowCalorie = lowCalorie
        super.init(brand: brand, name: name, volume: volume, price: price, manufacturedDate: manufacturedDate)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(self.lowCalorie, forKey: "lowCalorie")
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.lowCalorie = aDecoder.decodeBool(forKey: "lowCalorie")
    }
    
    func isLowCalorie() -> Bool {
        return self.lowCalorie
    }

    static func getKind() -> ObjectIdentifier {
        return ObjectIdentifier(self)
    }
}
