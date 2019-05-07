//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {

    convenience init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date) {
        self.init(brand: brand,
                  volume: volume,
                  price: price,
                  name: name,
                  manufacturedDate: manufacturedDate,
                  hot: true)
    }

    convenience init(expiryPeriod: ExpirationPeriod) {
        self.init(brand: "서울우유",
                  volume: 250,
                  price: 1500,
                  name: "초코우유",
                  manufacturedDate: Date.changeString(beforeString: "20190320"),
                  hot: false,
                  milkGrade: .BMilkGrade,
                  expiryPeriod: expiryPeriod
        )
    }

    convenience required init() {
        self.init(expiryPeriod: ExpirationPeriod(endDay: 6))
    }

}
