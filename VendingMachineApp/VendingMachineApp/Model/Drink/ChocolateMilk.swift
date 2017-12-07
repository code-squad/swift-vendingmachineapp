//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private(set) var ratioOfCocoaPowder: Float
    private enum CodingKeys: String {
        case ratioOfCocoaPowder
    }
    init?(brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          calorie: String,
          farmCode: String = "Unknown",
          ingredients: [String],
          ratioOfCocoaPowder: String) {
        guard let ratioOfCocoaPowder = ratioOfCocoaPowder.convertToFloat(from: "%") else {
            return nil
        }
        self.ratioOfCocoaPowder = ratioOfCocoaPowder
        super.init(brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   calorie: calorie,
                   farmCode: farmCode,
                   ingredients: ingredients)
        self.typeOfProduct = "초코우유"
    }
    
    required init?(coder aDecoder: NSCoder) {
        ratioOfCocoaPowder = aDecoder.decodeFloat(forKey: CodingKeys.ratioOfCocoaPowder.rawValue)
        super.init(coder: aDecoder)
        typeOfProduct = "초코우유"
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(ratioOfCocoaPowder, forKey: CodingKeys.ratioOfCocoaPowder.rawValue)
    }
}
