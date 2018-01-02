//
//  PepciCoke.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class PepsiCoke: Soda {
    private let taste: String = SodaCategory.pepsi.name

    override init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, lowCalorie: Bool) {
        super.init(brand: brand, weight: weight, price: price, name: name,
                   dateOfManufacture: dateOfManufacture, lowCalorie: lowCalorie)
    }

    init(lowCalorie: Bool) {
        super.init(sodaCategory: Soda.SodaCategory.pepsi, dateOfManufacture: Date(), lowCalorie: lowCalorie)
    }

    override var description: String {
        return "\(taste)(\(String(describing: PepsiCoke.self))) - " + super.description
    }

}
