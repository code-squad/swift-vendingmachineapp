//
//  Coffee.swift
//  VendingMachine
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Product {
    private var temperature: Double

    init(capacity: Int, price: Int, name: String, stringDate: String, temperature: Double) {
        self.temperature = temperature
        super.init(brand: "맥심", capacity: capacity, price: price, name: name, stringDate: stringDate)
    }

    func isHot() -> Bool {
        return temperature > 60.0
    }
}
