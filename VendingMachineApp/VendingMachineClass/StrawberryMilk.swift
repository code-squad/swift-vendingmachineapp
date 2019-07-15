//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by jang gukjin on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private var strawberryContent: Double

    init() {
        self.strawberryContent = 20
        super.init(capacity: 200, price: 2600, name: "딸기우유", stringDate: "20190630", milkFarmCode: 70306)
    }
}

