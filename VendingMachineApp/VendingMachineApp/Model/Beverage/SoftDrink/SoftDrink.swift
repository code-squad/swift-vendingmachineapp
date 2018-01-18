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
    private var carbonContent: Int
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String,
         _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu,
         carbonContent: Int) {
        self.carbonContent = carbonContent
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.carbonContent = try values.decode(Int.self, forKey: CodingKeys.carbonContent)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(carbonContent, forKey: .carbonContent)
        try super.encode(to: encoder)
    }

    var containsCarbonicGas: Bool {
        return self.carbonContent > 10
    }

    override func isLowCalorie() -> Bool {
        return super.calories < 250
    }

}
