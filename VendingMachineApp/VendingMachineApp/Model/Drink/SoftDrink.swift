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
    private enum CodingKeys: String {
        case amountOfSugar
    }
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
    required init?(coder aDecoder: NSCoder) {
        amountOfSugar = aDecoder.decodeInteger(forKey: CodingKeys.amountOfSugar.rawValue)
        super.init(coder: aDecoder)
        typeOfProduct = "탄산음료"
        maintenanceDay = 365 * 2

    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(amountOfSugar, forKey: CodingKeys.amountOfSugar.rawValue)
    }
    
    func isSuitableAmountOfSugar() -> Bool {
        return amountOfSugar < 50
    }

}
