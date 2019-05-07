//
//  CantataCoffee.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CantataCoffee: Coffee {

    convenience init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date) {
        self.init(brand: brand,
                  volume: volume,
                  price: price,
                  name: name,
                  manufacturedDate: manufacturedDate,
                  hot: true)
    }

    convenience init(expiryPeriod: ExpirationPeriod) {
        self.init(brand: "롯데칠성음료",
                  volume: 275,
                  price: 2000,
                  name: "칸타타 아메리카노",
                  manufacturedDate: Date.changeString(beforeString: "20190111"),
                  caffeine: 40,
                  expiryPeriod: expiryPeriod
        )
    }

    convenience required init() {
        self.init(expiryPeriod: ExpirationPeriod(endDay: 100))
    }

}
