//
//  Coffee.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: BeverageGroup {
    private let ice: Bool

    init(brand: String,
         name: String,
         volume: Int,
         price: Int,
         dateOfManufacture: Date,
         ice: Bool) {
        self.ice = ice
        super.init(brand: brand,
                   name: name,
                   volume: volume,
                   price: price,
                   dateOfManufacture: dateOfManufacture)
    }

    convenience required init() {
        self.init(
            brand: "노브랜드",
            name: "커피",
            volume: 470,
            price: 3000,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 10),
            ice: true)
    }

    override var group: BeverageCategory {
        return .coffee
    }

    func isHot() -> Bool {
        return !ice
    }

}
