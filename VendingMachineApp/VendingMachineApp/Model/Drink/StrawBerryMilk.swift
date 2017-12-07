//
//  StrawBerryMilk.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class StrawBerryMilk: Milk {
    private(set) var ratioOfStrawBerrySyrup: Float
    private enum CodingKeys: String {
        case ratioOfStrawBerrySyrup
    }
    init?(brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          calorie: String,
          farmCode: String = "Unknown",
          ingredients: [String],
          ratioOfStrawBerrySyrup: String) {
        guard let ratioOfStrawBerrySyrup = ratioOfStrawBerrySyrup.convertToFloat(from: "%") else {
            return nil
        }
        self.ratioOfStrawBerrySyrup = ratioOfStrawBerrySyrup
        super.init(brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   calorie: calorie,
                   farmCode: farmCode,
                   ingredients: ingredients)
        self.typeOfProduct = "딸기우유"
    }

    required init?(coder aDecoder: NSCoder) {
        ratioOfStrawBerrySyrup = aDecoder.decodeFloat(forKey: CodingKeys.ratioOfStrawBerrySyrup.rawValue)
        super.init(coder: aDecoder)
        typeOfProduct = "딸기우유"
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(ratioOfStrawBerrySyrup, forKey: CodingKeys.ratioOfStrawBerrySyrup.rawValue)
    }

}
