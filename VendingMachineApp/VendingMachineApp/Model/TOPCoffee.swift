//
//  TOPCoffee.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class TOPCoffee: Coffee {
    private var taste: String = CoffeeCategory.topCoffee.name

    enum TOPCoffeeKeys: String, CodingKey {
        case taste
    }

    init(hot: Bool) {
        super.init(coffeeCategory: Coffee.CoffeeCategory.topCoffee, dateOfManufacture: Date(), hot: hot)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: TOPCoffeeKeys.self)
        taste = try values.decode(String.self, forKey: .taste)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TOPCoffeeKeys.self)
        try container.encode(taste, forKey: .taste)
        try super.encode(to: encoder)
    }

    override var description: String {
        return "\(taste)(\(String(describing: TOPCoffee.self))) - " + super.description
    }

}
