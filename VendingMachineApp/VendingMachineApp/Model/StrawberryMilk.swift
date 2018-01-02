//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private let taste: String = "딸기우유"

    init(validate: Date) {
        super.init(milkCategory: Milk.MilkCategory.strawberry, dateOfManufacture: Date(), validate: validate)
    }

    override init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, validate: Date) {
        super.init(brand: brand, weight: weight, price: price, name: name,
                   dateOfManufacture: dateOfManufacture, validate: validate)
    }

    override var description: String {
        return "\(taste)(\(String(describing: StrawberryMilk.self))) - " + super.description
    }

}
