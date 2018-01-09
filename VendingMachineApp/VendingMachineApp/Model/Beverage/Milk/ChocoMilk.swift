//
//  ChocoMilk.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class ChocoMilk: Milk {
    private(set) var ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String,
                  _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int,
                  _ menuType: VendingMachine.Menu, manufacturerCode: Int, packingMaterial: String) {
        self.ingredients = "코코아분말"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType,
                   manufacturerCode: manufacturerCode, packingMaterial: packingMaterial)
    }

    convenience init(_ menu: VendingMachine.Menu) {
        self.init(stringData["brands"]![menu]!, intData["volume"]![menu]!, intData["price"]![menu]!,
                  stringData["productName"]![menu]!, Date(timeIntervalSinceNow: 0),
                  Date(timeIntervalSinceNow: TimeInterval(intData["expirationDate"]![menu]!)),
                  intData["calories"]![menu]!, menu, manufacturerCode: intData["manufacturerCode"]![menu]!,
                  packingMaterial: stringData["packingMaterial"]![menu]!)
    }

    override var description: String {
        return String.init(describing: type(of: self))
//        return "초코우유(" + String.init(describing: type(of: self)) + ") - " + super.description
    }
}
