//
//  PepciCoke.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class PepsiCoke: Soda {
    private var taste: String = SodaCategory.pepsi.name

    init(lowCalorie: Bool) {
        super.init(sodaCategory: Soda.SodaCategory.pepsi, dateOfManufacture: Date(), lowCalorie: lowCalorie)
    }

    required init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        taste = try value.decode(String.self)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(taste)
    }

    override var description: String {
        return "\(taste)(\(String(describing: PepsiCoke.self))) - " + super.description
    }

}
