//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    convenience init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date) {
        self.init(brand: brand,
                  volume: volume,
                  price: price,
                  name: name,
                  manufacturedDate: manufacturedDate,
                  hot: true)
    }

    convenience init(milkGrade: MilkGrade) {
        self.init(brand: "상하목장",
                  volume: 250,
                  price: 1500,
                  name: "바나나우유",
                  manufacturedDate: Date.changeString(beforeString: "20190320"),
                  hot: true,
                  milkGrade: milkGrade
                  )
    }

    convenience required init() {
        self.init(milkGrade: .AMilkGrade)
    }

}
