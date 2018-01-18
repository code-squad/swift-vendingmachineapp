//
//  CantataCoffee.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CantataCoffee: Coffee {
    private(set) var ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String,
                  _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu,
                  caffeineLevels: Int, isHot: Bool, isSweetened: Bool) {
        self.ingredients = "커피농축액(브라질산)"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType,
                   caffeineLevels: caffeineLevels, isHot: isHot, isSweetened: isSweetened)
    }

    convenience init(_ menu: VendingMachine.Menu) {
        self.init(stringData["brands"]![menu]!, intData["volume"]![menu]!, intData["price"]![menu]!,
                  stringData["productName"]![menu]!, Date(timeIntervalSinceNow: 0),
                  Date(timeIntervalSinceNow: TimeInterval(intData["expirationDate"]![menu]!)),
                  intData["calories"]![menu]!, menu,
                  caffeineLevels: intData["caffeineLevels"]![menu]!, isHot: false, isSweetened: true)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.ingredients = try values.decode(String.self, forKey: CodingKeys.ingredients)
        try super.init(from: decoder)
    }
    override var description: String {
        return String.init(describing: type(of: self))
//        return "칸타타커피(" + String.init(describing: type(of: self)) + ") - " + super.description
    }
}
