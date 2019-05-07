//
//  CocaCola.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CocaCola: Soda {

    convenience init(expiryPeriod: ExpirationPeriod) {
        self.init(brand: "코카콜라",
                  volume: 355,
                  price: 1500,
                  name: "코카콜라",
                  manufacturedDate: Date.changeString(beforeString: "20190213"),
                  suger: true,
                  expiryPeriod: expiryPeriod
        )
    }

    convenience required init() {
        self.init(expiryPeriod: ExpirationPeriod(endDay: 600))
    }

}
