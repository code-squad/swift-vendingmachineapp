//
//  TOPCoffee.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class TOPCoffee: Coffee {
    private let taste: String = "TOP커피"

    init(hot: Bool) {
        super.init(coffeeCategory: Coffee.CoffeeCategory.topCoffee, dateOfManufacture: Date(), hot: hot)
    }

    override init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, hot: Bool) {
        super.init(brand: brand, weight: weight, price: price, name: name,
                   dateOfManufacture: dateOfManufacture, hot: hot)
    }

    override var description: String {
        return "\(taste)(\(String(describing: TOPCoffee.self))) - " + super.description
    }

}
