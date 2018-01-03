//
//  Sprite.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Sprite: Soda {
    private var taste: String = SodaCategory.sprite.name

    init(lowCalorie: Bool) {
        super.init(sodaCategory: Soda.SodaCategory.sprite, dateOfManufacture: Date(), lowCalorie: lowCalorie)
    }

    required init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        taste = try value.decode(String.self)
        try super.init(from: decoder)
    }

    override var description: String {
        return "\(taste)(\(String(describing: Sprite.self))) - " + super.description
    }

}
