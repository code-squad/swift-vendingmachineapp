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
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double, pH: Double, color: Color) {
        self.color = color
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, expirationAt: expirationAt, temperature: temperature, pH: pH)
    }
    convenience init() {
        self.init(brand: "서울우유", capacity: 300, price: 800, name: "딸기우유", manufacturedAt: Date.input("20210302"), expirationAt: Date.input("20210310"), temperature: 5, pH: 6.5, color: StrawBerryMilk.Color.red)
    }
    func isRed() -> Bool {
        return self.color == Color.red
    }
}
