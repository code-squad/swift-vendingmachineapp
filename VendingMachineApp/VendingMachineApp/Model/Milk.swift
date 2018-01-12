//
//  Milk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var validate: Date

    enum MilkKeys: String, CodingKey {
        case validate
    }

    enum MilkCategory {
        case chocolate
        case banana
        case strawberry

        var brand: String {
            switch self {
            case .chocolate:
                return "서울우유"
            case .banana:
                return "서울우유"
            case .strawberry:
                return "서울우유"
            }
        }

        var name: String {
            switch self {
            case .chocolate:
                return "초코우유"
            case .banana:
                return "날마다바나나우유"
            case .strawberry:
                return "날마다딸기우유"
            }
        }

        var weight: Int {
            switch self {
            case .chocolate:
                return 250
            case .banana:
                return 250
            case .strawberry:
                return 250
            }
        }

        var price: Int {
            switch self {
            case .chocolate:
                return 1000
            case .banana:
                return 1000
            case .strawberry:
                return 1000
            }
        }

        var image: String {
            switch self {
            case .chocolate:
                return "chocoMilk.jpg"
            case .banana:
                return "bananaMilk.jpg"
            case .strawberry:
                return "strawberryMilk.jpg"
            }
        }
    }

    init(milkCategory: MilkCategory, dateOfManufacture: Date, validate: Date) {
        self.validate = validate
        super.init(brand: milkCategory.brand, weight: milkCategory.weight,
                   price: milkCategory.price, name: milkCategory.name,
                   dateOfManufacture: dateOfManufacture)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MilkKeys.self)
        validate = try values.decode(Date.self, forKey: .validate)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MilkKeys.self)
        try container.encode(validate, forKey: .validate)
        try super.encode(to: encoder)
    }

    func validate(with data: Date) -> Bool {
        return data < validate
    }

}
