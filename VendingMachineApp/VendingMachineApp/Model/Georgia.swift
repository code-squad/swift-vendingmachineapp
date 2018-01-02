//
//  Georgia.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    private let taste: String = CoffeeCategory.georgia.name

    init(hot: Bool) {
        super.init(coffeeCategory: CoffeeCategory.georgia, dateOfManufacture: Date(), hot: hot)
    }

    override init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, hot: Bool) {
        super.init(brand: brand, weight: weight, price: price, name: name,
                   dateOfManufacture: dateOfManufacture, hot: hot)
    }

    override var description: String {
        return "\(taste)(\(String(describing: Georgia.self))) - " + super.description
    }

}
