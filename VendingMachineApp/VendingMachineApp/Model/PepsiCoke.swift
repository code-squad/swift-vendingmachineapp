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

    enum PepsiCokeKeys: String, CodingKey {
        case taste
    }

    init(lowCalorie: Bool) {
        super.init(sodaCategory: Soda.SodaCategory.pepsi, dateOfManufacture: Date(), lowCalorie: lowCalorie)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PepsiCokeKeys.self)
        taste = try values.decode(String.self, forKey: .taste)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PepsiCokeKeys.self)
        try container.encode(taste, forKey: .taste)
        try super.encode(to: encoder)
    }

    override var description: String {
        return "\(taste)(\(String(describing: PepsiCoke.self))) - " + super.description
    }

}
