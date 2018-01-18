//
//  FantaSoftDrink.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class FantaSoftDrink: SoftDrink {
    private var ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String,
                  _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu,
                  carbonContent: Int) {
        self.ingredients = "합성착향료(오렌지향)"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType,
                   carbonContent: carbonContent)
    }
    convenience init(_ menu: VendingMachine.Menu) {
        self.init(stringData[Beverage.CodingKeys.brand]![menu]!,
                  intData[Beverage.CodingKeys.volume]![menu]!,
                  intData[Beverage.CodingKeys.price]![menu]!,
                  stringData[Beverage.CodingKeys.productName]![menu]!,
                  Date(timeIntervalSinceNow: 0),
                  Date(timeIntervalSinceNow: TimeInterval(intData[Beverage.CodingKeys.expirationDate]![menu]!)),
                  intData[Beverage.CodingKeys.calories]![menu]!,
                  menu,
                  carbonContent: intData[Beverage.CodingKeys.carbonContent]![menu]!)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.ingredients = try values.decode(String.self, forKey: CodingKeys.ingredients)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ingredients, forKey: .ingredients)
        try super.encode(to: encoder)
    }

    override var description: String {
        return String.init(describing: type(of: self))
    }
}
