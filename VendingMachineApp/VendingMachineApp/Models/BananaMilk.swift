//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

class BananaMilk: Milk {
    private let isUnsweetened: Bool
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, farmCode: String, expriryDate: Date, isUnsweetened: Bool, temperature: Int, calorie: Int) {
        self.isUnsweetened = isUnsweetened
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price, farmCode: farmCode, temperature: temperature, calorie: calorie)
    }
}
