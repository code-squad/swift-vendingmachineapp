//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class SoftDrink: Beverage {
    // 탄산첨가여부, 유통기한, 칼로리
    private let carbonContent: Int
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String,
         _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu,
         carbonContent: Int) {
        self.carbonContent = carbonContent
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType)
    }
    required convenience init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    var containsCarbonicGas: Bool {
        return self.carbonContent > 10
    }

    override func isLowCalorie() -> Bool {
        return super.calories < 250
    }

}
