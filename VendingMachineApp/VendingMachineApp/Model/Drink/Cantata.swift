//
//  Cantata.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Cantata: Coffee {
    private(set) var taste: Taste
    private enum CodingKeys: String {
        case taste = "CantataTaste"
    }
    enum Taste: Int {
        case americano, primiumLatte
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
          taste: Taste) {
        self.taste = taste
        super.init(calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   isHot: isHot,
                   amountOfCaffeine: amountOfCaffeine,
                   nameOfCoffeeBeans: nameOfCoffeeBeans)
        self.typeOfProduct = "칸타타커피"
    }

    required init?(coder aDecoder: NSCoder) {
        guard let taste = Taste(rawValue: aDecoder.decodeInteger(forKey: CodingKeys.taste.rawValue)) else {
            return nil
        }
        self.taste = taste
        super.init(coder: aDecoder)
        typeOfProduct = "칸타타커피"
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(taste.rawValue, forKey: CodingKeys.taste.rawValue)
    }

}
