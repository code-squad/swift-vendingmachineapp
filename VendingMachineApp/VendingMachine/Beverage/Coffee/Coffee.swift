//
//  Coffee.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var hot: Bool = false

    init(brand: String, name: String, volume: Int, price: Int, manufacturedDate: Date, hot: Bool) {
        self.hot = hot
        super.init(brand: brand, name: name, volume: volume, price: price, manufacturedDate: manufacturedDate)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(self.hot, forKey: "hot")
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.hot = aDecoder.decodeBool(forKey: "hot")
    }
    
    func isHot() -> Bool {
        return self.hot
    }

    static func getKind() -> ObjectIdentifier {
        return ObjectIdentifier(self)
    }

}
