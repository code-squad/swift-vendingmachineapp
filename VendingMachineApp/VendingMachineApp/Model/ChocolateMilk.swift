//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private var taste: String = MilkCategory.chocolate.name

    enum ChocolateMilkKeys: String, CodingKey {
        case taste
    }

    init(validate: Date) {
        super.init(milkCategory: Milk.MilkCategory.chocolate, dateOfManufacture: Date(), validate: validate)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ChocolateMilkKeys.self)
        taste = try values.decode(String.self, forKey: .taste)
        try super.init(from: decoder)
    }

    override var description: String {
        return "\(taste)(\(String(describing: ChocolateMilk.self))) - " + super.description
    }

}
