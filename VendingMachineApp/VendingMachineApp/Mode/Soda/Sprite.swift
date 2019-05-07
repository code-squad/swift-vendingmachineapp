//
//  Sprite.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Sprite: Soda {

    convenience init(suger: Bool) {
        self.init(brand: "코카콜라",
                  volume: 355,
                  price: 1500,
                  name: "스프라이트",
                  manufacturedDate: Date.changeString(beforeString: "20190513"),
                  suger: suger
        )
    }

    convenience required init() {
        self.init(suger: true)
    }

}
