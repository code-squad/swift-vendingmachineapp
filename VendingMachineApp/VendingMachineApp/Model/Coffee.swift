//
//  Coffee.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var hot: Bool

    enum CoffeeKeys: String, CodingKey {
        case hot
    }

    enum CoffeeCategory {
        case georgia
        case cantata
        case topCoffee

        var brand: String {
            switch self {
            case .georgia:
                return "코카콜라"
            case .cantata:
                return "Cantata"
            case .topCoffee:
                return "맥심"
            }
        }

        var name: String {
            switch self {
            case .georgia:
                return "죠지아"
            case .cantata:
                return "칸타타"
            case .topCoffee:
                return "TOP아메리카노"
            }
        }

        var weight: Int {
            switch self {
            case .georgia:
                return 400
            case .cantata:
                return 400
            case .topCoffee:
                return 400
            }
        }

        var price: Int {
            switch self {
            case .georgia:
                return 3000
            case .cantata:
                return 3000
            case .topCoffee:
                return 3000
            }
        }
    }

    init(coffeeCategory: CoffeeCategory, dateOfManufacture: Date, hot: Bool) {
        self.hot = hot
        super.init(brand: coffeeCategory.brand, weight: coffeeCategory.weight,
                   price: coffeeCategory.price, name: coffeeCategory.name,
                   dateOfManufacture: dateOfManufacture)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CoffeeKeys.self)
        hot = try values.decode(Bool.self, forKey: .hot)
        try super.init(from: decoder)
    }

    func isHot() -> Bool {
        return hot
    }

}
