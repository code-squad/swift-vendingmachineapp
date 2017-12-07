//
//  Coke.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Coke: SoftDrink {
    override init?(calorie: String,
                   brand: String,
                   weight: String,
                   price: String,
                   name: String,
                   dateOfManufacture: String,
                   amountOfSugar: String) {
        super.init(calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   amountOfSugar: amountOfSugar)
        self.typeOfProduct = "콜라"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.typeOfProduct = "콜라"
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }

    func isZeroCoke() -> Bool {
        return calorie < 4
    }

}
