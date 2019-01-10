//
//  Coffee.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage, VariousTemperatures {
    let hasMilk: Bool
    let isHot: Bool

    init(hasMilk: Bool, isHot: Bool, brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.hasMilk = hasMilk
        self.isHot = isHot
        super.init(brand: brand, size: size, price: price, name: name, expiryDate: expiryDate)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(hasMilk, forKey: BeverageArchiveKey.hasMilk)
        aCoder.encode(isHot, forKey: BeverageArchiveKey.isHot)
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        hasMilk = aDecoder.decodeBool(forKey: BeverageArchiveKey.hasMilk)
        isHot = aDecoder.decodeBool(forKey: BeverageArchiveKey.isHot)
        super.init(coder: aDecoder)
    }
}
