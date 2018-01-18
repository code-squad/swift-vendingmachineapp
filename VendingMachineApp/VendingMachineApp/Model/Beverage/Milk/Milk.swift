//
//  Milk.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    // 우유 농장 코드, 뜨거운음료여부, 포장재질, 유통기한, 칼로리
    private var manufacturerCode: Int
    private var packingMaterial: String
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String,
         _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int,
         _ menuType: VendingMachine.Menu, manufacturerCode: Int, packingMaterial: String) {
        self.manufacturerCode = manufacturerCode
        self.packingMaterial = packingMaterial
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.manufacturerCode = try values.decode(Int.self, forKey: CodingKeys.manufacturerCode)
        self.packingMaterial = try values.decode(String.self, forKey: CodingKeys.packingMaterial)
        try super.init(from: decoder)
    }

    func isManufacturedFrom(_ factory: Int) -> Bool {
        return self.manufacturerCode == factory
    }

    override func isLowCalorie() -> Bool {
        return super.calories < 150
    }
}
