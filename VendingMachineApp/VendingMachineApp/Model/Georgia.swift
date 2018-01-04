//
//  Georgia.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    private var taste: String = CoffeeCategory.georgia.name

    enum GeorgiaKeys: String, CodingKey {
        case taste
    }

    init(hot: Bool) {
        super.init(coffeeCategory: CoffeeCategory.georgia, dateOfManufacture: Date(), hot: hot)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: GeorgiaKeys.self)
        taste = try values.decode(String.self, forKey: .taste)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: GeorgiaKeys.self)
        try container.encode(taste, forKey: .taste)
        try super.encode(to: encoder)
    }

    override var description: String {
        return "\(taste)(\(String(describing: Georgia.self))) - " + super.description
    }

}
