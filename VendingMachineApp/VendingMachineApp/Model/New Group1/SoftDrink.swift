//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class SoftDrink: Drink {
    private(set) var amountOfSugar: Int
    init?(calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          amountOfSugar: String) {
        guard let amountOfSugar = amountOfSugar.convertToInt(from: "g") else {
            return nil
        }
        self.amountOfSugar = amountOfSugar
        super.init(calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)
        self.typeOfProduct = "탄산음료"
        // 제조일로부터 24개월
        self.maintenanceDay = 365 * 2
    }

    func isSuitableAmountOfSugar() -> Bool {
        return amountOfSugar < 50
    }

}
