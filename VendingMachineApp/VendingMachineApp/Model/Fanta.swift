//
//  Fanta.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Fanta: Soda {
    private var taste: String = SodaCategory.fanta.name

    init(lowCalorie: Bool) {
        super.init(sodaCategory: Soda.SodaCategory.fanta, dateOfManufacture: Date(), lowCalorie: lowCalorie)
    }

    required init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        taste = try value.decode(String.self)
        try super.init(from: decoder)
    }

    override var description: String {
        return "\(taste)(\(String(describing: Fanta.self))) - " + super.description
    }

}
