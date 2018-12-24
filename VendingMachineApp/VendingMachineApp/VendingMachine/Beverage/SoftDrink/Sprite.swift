//
//  Sprite.swift
//  VendingMachine
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Sprite: SoftDrink {

    convenience init(volume: Int,
                     price: Int,
                     dateOfManufacture: Date,
                     package: BeveragePackage) {
        self.init(brand: "코카콜라컴퍼니",
                  name: "스프라이트",
                  volume: volume,
                  price: price,
                  dateOfManufacture: dateOfManufacture,
                  package: package)
    }

    convenience required init() {
        self.init(volume: 250,
                  price: 1200,
                  dateOfManufacture: Date.subtractingDaysFromNow(by: 30),
                  package: .can)
    }

}
