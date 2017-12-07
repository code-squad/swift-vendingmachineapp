//
//  Fanta.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Fanta: SoftDrink {
    private(set) var taste: Taste
    enum Taste: Int {
        case orange, pineapple, grape
    }
    private enum CodingKeys: String {
        case taste = "FantaTaste"
    }
    init?(calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          amountOfSugar: String,
          taste: Taste) {
        self.taste = taste
        super.init(calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   amountOfSugar: amountOfSugar)
        typeOfProduct = "환타"
    }

    required init?(coder aDecoder: NSCoder) {
        guard let taste = Taste(rawValue: aDecoder.decodeInteger(forKey: CodingKeys.taste.rawValue)) else {
            return nil
        }
        self.taste = taste
        super.init(coder: aDecoder)
        typeOfProduct = "환타"
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(taste.rawValue, forKey: CodingKeys.taste.rawValue)
    }

}
