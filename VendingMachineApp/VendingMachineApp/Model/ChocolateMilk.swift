//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private let taste: String = "초코우유"

    init(validate: Date) {
        super.init(milkCategory: Milk.MilkCategory.chocolate, dateOfManufacture: Date(), validate: validate)
    }

    override init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, validate: Date) {
        super.init(brand: brand, weight: weight, price: price, name: name,
                   dateOfManufacture: dateOfManufacture, validate: validate)
    }

    override var description: String {
        return "\(taste)(\(String(describing: ChocolateMilk.self))) - " + super.description
    }

}
