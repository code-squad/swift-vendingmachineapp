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

    enum FantaKeys: String, CodingKey {
        case taste
    }

    init(lowCalorie: Bool) {
        super.init(sodaCategory: Soda.SodaCategory.fanta, dateOfManufacture: Date(), lowCalorie: lowCalorie)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: FantaKeys.self)
        taste = try values.decode(String.self, forKey: .taste)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: FantaKeys.self)
        try container.encode(taste, forKey: .taste)
        try super.encode(to: encoder)
    }

    override var description: String {
        return "\(taste)(\(String(describing: Fanta.self))) - " + super.description
    }

}
