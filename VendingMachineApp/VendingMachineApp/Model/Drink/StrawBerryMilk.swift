//
//  StrawBerryMilk.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class StrawBerryMilk: Milk {
    var ratioOfStrawBerrySyrup: Float
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

}
