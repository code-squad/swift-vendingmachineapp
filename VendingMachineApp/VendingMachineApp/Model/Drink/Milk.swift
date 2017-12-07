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
    private enum CodingKeys: String {
        case farmCode, ingredients
    }
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
        typeOfProduct = "우유"
        /// 유통기한: 제조일로부터 45일
        maintenanceDay = 45
    }

    required init?(coder aDecoder: NSCoder) {
        guard let farmCode = aDecoder.decodeObject(forKey: CodingKeys.farmCode.rawValue) as? String,
            let ingredients = aDecoder.decodeObject(forKey: CodingKeys.ingredients.rawValue) as? [String] else{
            return nil
        }
        self.farmCode = farmCode
        self.ingredients = ingredients
        super.init(coder: aDecoder)
        typeOfProduct = "우유"
        maintenanceDay = 45
    }

    override func encode(with aCoder: NSCoder) {
        aCoder.encode(farmCode, forKey: CodingKeys.farmCode.rawValue)
        aCoder.encode(ingredients, forKey: CodingKeys.ingredients.rawValue)
        super.encode(with: aCoder)
    }


    func isEasyOfDigestion() -> Bool {
        return ingredients.contains("lactose")
    }

    func isLowCalorie() -> Bool {
        return calorie <= 100
    }

}
