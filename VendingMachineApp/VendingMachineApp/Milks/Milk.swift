//
//  Milk.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let lactose: Int

    init(lactose: Int, brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.lactose = lactose
        super.init(brand: brand, size: size, price: price, name: name, expiryDate: expiryDate)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(lactose, forKey: BeverageArchiveKey.lactose)
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        lactose = aDecoder.decodeInteger(forKey: BeverageArchiveKey.lactose)
        super.init(coder: aDecoder)
    }
    
    func hasLactose() -> Bool {
        return self.lactose > 0
    }
}
