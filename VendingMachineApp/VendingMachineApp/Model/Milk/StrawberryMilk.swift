//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class StrawberryMilk: Milk {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "서울우유", volume: 200, price: 600, name: "딸기우유", manufacturedAt: date)
    }
}
