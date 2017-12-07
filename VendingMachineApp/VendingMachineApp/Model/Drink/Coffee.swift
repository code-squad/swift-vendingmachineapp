//
//  Coffee.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Coffee: Drink {
    private(set) var isHot: Bool
    private(set) var amountOfCaffeine: Int
    private(set) var nameOfCoffeeBeans: String
    private enum CodingKeys: String {
        case isHot, amountOfCaffeine, nameOfCoffeeBeans
    }

    init?(calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          isHot: Bool,
          amountOfCaffeine: String,
          nameOfCoffeeBeans: String) {
        self.isHot = isHot
        guard let amountOfCaffeine = amountOfCaffeine.convertToInt(from: "mg") else {
            return nil
        }
        self.amountOfCaffeine = amountOfCaffeine
        self.nameOfCoffeeBeans = nameOfCoffeeBeans
        super.init(calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)
        self.typeOfProduct = "커피"
        // 제조일로부터 12개월
        self.maintenanceDay = 365
    }

    required init?(coder aDecoder: NSCoder) {
        isHot = aDecoder.decodeBool(forKey: CodingKeys.isHot.rawValue)
        amountOfCaffeine = aDecoder.decodeInteger(forKey: CodingKeys.amountOfCaffeine.rawValue)
        guard let nameOfCoffeeBeans = aDecoder.decodeObject(forKey: CodingKeys.nameOfCoffeeBeans.rawValue) as? String else {
            return nil
        }
        self.nameOfCoffeeBeans = nameOfCoffeeBeans
        super.init(coder: aDecoder)
        typeOfProduct = "커피"
        maintenanceDay = 365
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(isHot, forKey: CodingKeys.isHot.rawValue)
        aCoder.encode(amountOfCaffeine, forKey: CodingKeys.amountOfCaffeine.rawValue)
        aCoder.encode(nameOfCoffeeBeans, forKey: CodingKeys.nameOfCoffeeBeans.rawValue)
    }

    func isSuitableAmountOfCaffeine(to age: Int) -> Bool {
        return (age > 19 && amountOfCaffeine == 400) ||
            (age <= 19 && amountOfCaffeine == 125)
    }

    func isLowCalorie() -> Bool {
        return calorie <= 30
    }

}
