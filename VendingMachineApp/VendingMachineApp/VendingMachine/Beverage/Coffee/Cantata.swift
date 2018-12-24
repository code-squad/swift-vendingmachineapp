//
//  Cantata.swift
//  VendingMachine
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Cantata: Coffee {

    convenience init(name: String,
                     volume: Int,
                     price: Int,
                     dateOfManufacture: Date,
                     ice: Bool) {
        self.init(brand: "롯데칠성",
                  name: name,
                  volume: volume,
                  price: price,
                  dateOfManufacture: dateOfManufacture,
                  ice: ice)
    }

    convenience required init() {
        self.init(name: "칸타타 더치블랙",
                  volume: 275,
                  price: 2200,
                  dateOfManufacture: Date.subtractingDaysFromNow(by: 12),
                  ice: false)
    }

}
