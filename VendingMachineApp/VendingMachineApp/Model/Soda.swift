//
//  Soda.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private let lowCalorie: Bool

    enum SodaKeys: String, CodingKey {
        case lowCalorie
    }

    enum SodaCategory {
        case sprite
        case fanta
        case pepsi

        var brand: String {
            switch self {
            case .sprite:
                return "코카콜라"
            case .fanta:
                return "코카콜라"
            case .pepsi:
                return "펩시"
            }
        }

        var name: String {
            switch self {
            case .sprite:
                return "스프라이트"
            case .fanta:
                return "환타"
            case .pepsi:
                return "펩시콜라"
            }
        }

        var weight: Int {
            switch self {
            case .sprite:
                return 350
            case .fanta:
                return 350
            case .pepsi:
                return 350
            }
        }

        var price: Int {
            switch self {
            case .sprite:
                return 2000
            case .fanta:
                return 2000
            case .pepsi:
                return 2000
            }
        }

        var image: String {
            switch self {
            case .sprite:
                return "sprite.jpg"
            case .fanta:
                return "fanta.jpg"
            case .pepsi:
                return "pepsi.jpg"
            }
        }
    }

    init(sodaCategory: SodaCategory, dateOfManufacture: Date, lowCalorie: Bool) {
        self.lowCalorie = lowCalorie
        super.init(brand: sodaCategory.brand,
                   weight: sodaCategory.weight,
                   price: sodaCategory.price,
                   name: sodaCategory.name,
                   dateOfManufacture: dateOfManufacture,
                   image: sodaCategory.image)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: SodaKeys.self)
        lowCalorie = try values.decode(Bool.self, forKey: .lowCalorie)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SodaKeys.self)
        try container.encode(lowCalorie, forKey: .lowCalorie)
        try super.encode(to: encoder)
    }

    func isLowCalorie() -> Bool {
        return lowCalorie
    }

}
