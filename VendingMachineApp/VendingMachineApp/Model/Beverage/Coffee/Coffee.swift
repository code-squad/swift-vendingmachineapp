//
//  Coffee.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    // 카페인 함유량, 뜨거운음료여부, 무가당여부, 유통기한, 칼로리
    private var caffeineLevels: Int
    private(set) var isHot: Bool
    private var isSweetened: Bool
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String,
         _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu,
         caffeineLevels: Int, isHot: Bool, isSweetened: Bool) {
        self.caffeineLevels = caffeineLevels
        self.isHot = isHot
        self.isSweetened = isSweetened
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.caffeineLevels = try values.decode(Int.self, forKey: CodingKeys.caffeineLevels)
        self.isHot = try values.decode(Bool.self, forKey: CodingKeys.isHot)
        self.isSweetened = try values.decode(Bool.self, forKey: CodingKeys.isSweetened)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(caffeineLevels, forKey: .caffeineLevels)
        try container.encode(isHot, forKey: .isHot)
        try container.encode(isSweetened, forKey: .isSweetened)
        try super.encode(to: encoder)
    }

    func isDecaffeinated() -> Bool {
        return caffeineLevels <= 10
    }

    func isUnSweetened() -> Bool {
        return !self.isSweetened
    }

    override func isLowCalorie() -> Bool {
        return super.calories < 150
    }

}
