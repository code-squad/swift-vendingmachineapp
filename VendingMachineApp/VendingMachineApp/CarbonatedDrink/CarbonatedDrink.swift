//
//  CarbonatedDrink.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CarbonatedDrink: Beverage {
    private let calorie: Int

    init(calorie: Int, brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.calorie = calorie
        super.init(brand: brand, size: size, price: price, name: name, expiryDate: expiryDate)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(calorie, forKey: BeverageArchiveKey.calorie)
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        calorie = aDecoder.decodeInteger(forKey: BeverageArchiveKey.calorie)
        super.init(coder: aDecoder)
    }
    
    func isLowCalorie() -> Bool {
        return self.calorie < 10
    }
}
