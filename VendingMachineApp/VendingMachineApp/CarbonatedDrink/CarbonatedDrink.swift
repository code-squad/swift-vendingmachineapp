//
//  CarbonatedDrink.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CarbonatedDrink: Beverage {
    
    //MARK: - Keys
    
    private let calorieKey: String = "calorie"
    
    //MARK: Encode, Decode
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(calorie, forKey: self.calorieKey)
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        calorie = aDecoder.decodeInteger(forKey: self.calorieKey)
        super.init(coder: aDecoder)
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private let calorie: Int

    //MARK: Initialize
    
    init(calorie: Int, brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.calorie = calorie
        super.init(brand: brand, size: size, price: price, name: name, expiryDate: expiryDate)
    }
    
    //MARK: - Methods
    
    func isLowCalorie() -> Bool {
        return self.calorie < 10
    }
}
