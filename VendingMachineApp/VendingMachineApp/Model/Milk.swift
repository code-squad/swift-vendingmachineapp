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
    }

    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, validate: Date) {
        self.validate = validate
        super.init(brand: brand, weight: weight, price: price, name: name, dateOfManufacture: dateOfManufacture)
    }

    init(milkCategory: MilkCategory, dateOfManufacture: Date, validate: Date) {
        self.validate = validate
        super.init(brand: milkCategory.brand, weight: milkCategory.weight,
                   price: milkCategory.price, name: milkCategory.name,
                   dateOfManufacture: dateOfManufacture)
    }

    func validate(with data: Date) -> Bool {
        return data < validate
    }

}
