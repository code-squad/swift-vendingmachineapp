//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class StrawBerryMilk: Milk {
    enum Color {
        case white
        case pink
        case red
    }
    private var color: Color
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, expirationDate: Date, temperature: Double, pH: Double, color: Color) {
        self.color = color
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, expirationDate: expirationDate, temperature: temperature, pH: pH)
    }
    func isRed() -> Bool {
        return self.color == Color.red
    }
}
