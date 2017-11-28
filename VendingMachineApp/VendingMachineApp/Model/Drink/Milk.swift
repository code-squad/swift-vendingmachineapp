//
//  Milk.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Milk: Drink {
    private(set) var farmCode: String
    private(set) var ingredients: [String]
    init?(brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          calorie: String,
          farmCode: String = "Unknown",
          ingredients: [String] = [String]()) {
        self.farmCode = farmCode
        self.ingredients = ingredients
        super.init(calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)
        self.typeOfProduct = "우유"
        /// 유통기한: 제조일로부터 45일
        self.maintenanceDay = 45
    }

    func isEasyOfDigestion() -> Bool {
        return ingredients.contains("lactose")
    }

    func isLowCalorie() -> Bool {
        return calorie <= 100
    }

}
