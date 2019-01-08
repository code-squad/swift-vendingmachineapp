//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {

    convenience init(brand: String,
                     name: String,
                     volume: Int,
                     price: Int,
                     dateOfManufacture: Date) {
        self.init(brand: brand,
                  name: name,
                  volume: volume,
                  price: price,
                  dateOfManufacture: dateOfManufacture,
                  flavor: "딸기")
    }

    convenience init(brand: String,
                     name: String,
                     volume: Int,
                     price: Int,
                     dateOfManufacture: Date,
                     useByDate: Double,
                     package: BeveragePackage) {
        self.init(brand: brand,
                  name: name,
                  volume: volume,
                  price: price,
                  dateOfManufacture: dateOfManufacture,
                  flavor: "딸기",
                  useByDate: useByDate,
                  package: package)
    }

    convenience init(daysBefore: Double) {
        self.init(brand: "서울우유",
                  name: "언니몰래먹는딸기우유",
                  volume: 200,
                  price: 2000,
                  dateOfManufacture: Date.subtractingDaysFromNow(by: daysBefore))
    }

    convenience required init() {
        self.init(daysBefore: 4)
    }

}
