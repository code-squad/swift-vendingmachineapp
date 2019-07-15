//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by jang gukjin on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private var fattyContent: Double

    init() {
        self.fattyContent = 1.4
        super.init(capacity: 260, price: 1800, name: "초코우유", stringDate: "20190720", milkFarmCode: 63826)
    }
}

