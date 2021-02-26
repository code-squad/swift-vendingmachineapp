//
//  StrawberryMilk.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class StrawberryMilk: Milk {

    override init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, type: MilkType, lowFat: Bool) {
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, type: type, lowFat: lowFat)
    }
}
