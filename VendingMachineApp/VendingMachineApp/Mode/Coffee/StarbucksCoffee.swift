//
//  StarbucksCoffee.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StarbucksCoffee: Coffee {

    convenience init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date) {
        self.init(brand: brand,
                  volume: volume,
                  price: price,
                  name: name,
                  manufacturedDate: manufacturedDate,
                  hot: true)
    }

    convenience init(expiryPeriod: ExpirationPeriod) {
        self.init(brand: "동서식품",
                  volume: 281,
                  price: 3000,
                  name: "스타벅스 모카",
                  manufacturedDate: Date.changeString(beforeString: "20190915"),
                  caffeine: 30,
                  hot: true,
                  expiryPeriod: expiryPeriod
        )
    }

    convenience required init() {
        self.init(expiryPeriod: ExpirationPeriod(endDay: 110))
    }

}
