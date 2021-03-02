//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

class BananaMilk: Milk  {
    private let farmCode: String
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, temperature: Int, calorie: Int, fatContent: Int, farmCode: String, expiredAt: Date) {
        self.farmCode = farmCode
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price, temperature: temperature, calorie: calorie, fatContent: fatContent, expiredAt: expiredAt)
    }
}
