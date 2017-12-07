//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private(set) var ratioOfBananaSyrup: Float
    private enum CodingKeys: String {
        case ratioOfBananaSyrup
    }
    init?(brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          calorie: String,
          farmCode: String = "Unknown",
          ingredients: [String],
          ratioOfBananaSyrup: String) {
        guard let ratioOfBananaSyrup = ratioOfBananaSyrup.convertToFloat(from: "%") else {
            return nil
        }
        self.ratioOfBananaSyrup = ratioOfBananaSyrup
        super.init(brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   calorie: calorie,
                   farmCode: farmCode,
                   ingredients: ingredients)
        self.typeOfProduct = "바나나우유"
    }
    
    required init?(coder aDecoder: NSCoder) {
        ratioOfBananaSyrup = aDecoder.decodeFloat(forKey: CodingKeys.ratioOfBananaSyrup.rawValue)
        super.init(coder: aDecoder)
        typeOfProduct = "바나나우유"
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(ratioOfBananaSyrup, forKey: CodingKeys.ratioOfBananaSyrup.rawValue)
    }

}
