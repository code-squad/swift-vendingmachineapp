//
//  Georgia.swift
//  VendingMachine
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Georgia: Coffee {

    convenience init(name: String,
                     volume: Int,
                     price: Int,
                     dateOfManufacture: Date,
                     ice: Bool) {
        self.init(brand: "조지아",
                  name: name,
                  volume: volume,
                  price: price,
                  dateOfManufacture: dateOfManufacture,
                  ice: ice)
    }

    convenience required init() {
        self.init(name: "조지아 카페라떼",
                  volume: 300,
                  price: 2500,
                  dateOfManufacture: Date.subtractingDaysFromNow(by: 10),
                  ice: true)
    }

}
