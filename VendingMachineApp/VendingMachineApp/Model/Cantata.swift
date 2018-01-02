//
//  Kantata.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Cantata: Coffee {
    private let taste: String = "칸타타커피"

    init(hot: Bool) {
        super.init(coffeeCategory: Coffee.CoffeeCategory.cantata, dateOfManufacture: Date(), hot: hot)
    }

    override init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, hot: Bool) {
        super.init(brand: brand, weight: weight, price: price, name: name,
                   dateOfManufacture: dateOfManufacture, hot: hot)
    }

    override var description: String {
        return "\(taste)(\(String(describing: Cantata.self))) - " + super.description
    }

}
