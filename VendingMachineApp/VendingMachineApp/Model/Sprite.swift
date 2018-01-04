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

    enum SpriteKeys: String, CodingKey {
        case taste
    }

    init(lowCalorie: Bool) {
        super.init(sodaCategory: Soda.SodaCategory.sprite, dateOfManufacture: Date(), lowCalorie: lowCalorie)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: SpriteKeys.self)
        taste = try values.decode(String.self, forKey: .taste)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SpriteKeys.self)
        try container.encode(taste, forKey: .taste)
        try super.encode(to: encoder)
    }

    override var description: String {
        return "\(taste)(\(String(describing: Sprite.self))) - " + super.description
    }

}
