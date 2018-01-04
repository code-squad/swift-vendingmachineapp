//
//  Kantata.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Cantata: Coffee {
    private var taste: String = CoffeeCategory.cantata.name

    enum CantataKeys: String, CodingKey {
        case taste
    }

    init(hot: Bool) {
        super.init(coffeeCategory: Coffee.CoffeeCategory.cantata, dateOfManufacture: Date(), hot: hot)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CantataKeys.self)
        taste = try values.decode(String.self, forKey: .taste)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CantataKeys.self)
        try container.encode(taste, forKey: .taste)
        try super.encode(to: encoder)
    }

    override var description: String {
        return "\(taste)(\(String(describing: Cantata.self))) - " + super.description
    }

}
