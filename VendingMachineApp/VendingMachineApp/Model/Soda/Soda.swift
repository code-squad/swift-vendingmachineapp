//
//  Soda.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private var calorie: Int
    
    init(name: String, price: Int, calorie: Int) {
        self.calorie = calorie
        super.init(name: name, price: price)
    }
    
    convenience init() {
        self.init(name: DefaultData.soda.name, price: DefaultData.soda.price, calorie: 0)
    }
    
    private struct NSCoderKeys {
        static let calorieKey = "calorie"
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(NSNumber(value: calorie), forKey: NSCoderKeys.calorieKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let calorie = aDecoder.decodeObject(of: NSNumber.self, forKey: NSCoderKeys.calorieKey) else {
            return nil
        }
        self.calorie = calorie.intValue
        super.init(coder: aDecoder)
    }
}
