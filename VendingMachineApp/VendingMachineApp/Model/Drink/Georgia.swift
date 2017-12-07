//
//  Georgia.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    private(set) var size: Size
    enum Size: Int {
        case original, max
    }
    private enum CodingKeys: String {
        case size
    }
    init?(calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          isHot: Bool,
          amountOfCaffeine: String,
          nameOfCoffeeBeans: String,
          size: Size) {
        self.size = size
        super.init(calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   isHot: isHot,
                   amountOfCaffeine: amountOfCaffeine,
                   nameOfCoffeeBeans: nameOfCoffeeBeans)
        self.typeOfProduct = "조지아커피"
    }

    required init?(coder aDecoder: NSCoder) {
        guard let size = Size(rawValue: aDecoder.decodeInteger(forKey: CodingKeys.size.rawValue)) else {
            return nil
        }
        self.size = size
        super.init(coder: aDecoder)
        typeOfProduct = "조지아커피"
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(size.rawValue, forKey: CodingKeys.size.rawValue)
    }

}
