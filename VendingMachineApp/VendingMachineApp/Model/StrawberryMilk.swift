//
//  File.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class StrawberryMilk : Milk {
    init(liter: Int, price: Int, name: String, manufactured: Date) {
        super.init(brand: Brand.Milk(.SeoulMilk), liter: liter, price: price, name: name, manufactured: manufactured)
    }
}
