//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private var taste: String = MilkCategory.banana.name

    enum BananaMilkKeys: String, CodingKey {
        case taste
    }

    init(validate: Date) {
        super.init(milkCategory: Milk.MilkCategory.banana, dateOfManufacture: Date(), validate: validate)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: BananaMilkKeys.self)
        taste = try values.decode(String.self, forKey: .taste)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BananaMilkKeys.self)
        try container.encode(taste, forKey: .taste)
    }

    override var description: String {
        return "\(taste)(\(String(describing: BananaMilk.self))) - " + super.description
    }

}
