//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private var taste: String = MilkCategory.strawberry.name

    enum StrawberryMilkKeys: String, CodingKey {
        case taste
    }

    init(validate: Date) {
        super.init(milkCategory: Milk.MilkCategory.strawberry, dateOfManufacture: Date(), validate: validate)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StrawberryMilkKeys.self)
        taste = try values.decode(String.self, forKey: .taste)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StrawberryMilkKeys.self)
        try container.encode(taste, forKey: .taste)
    }

    override var description: String {
        return "\(taste)(\(String(describing: StrawberryMilk.self))) - " + super.description
    }

}
