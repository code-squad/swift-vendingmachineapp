//
//  StrawberryFactory.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/10.
//

import Foundation

class StrawberryMilkFactory {
    static func createBeverage() -> Beverage {
        return StrawBerryMilk(brand: "서울우유", capacity: 250, price: 800, name: "딸기우유", manufacturedAt: Date.input("20210301"), expirationAt: Date.input("20210310"), temperature: 5, pH: 6.5, color: StrawBerryMilk.Color.pink)
    }
}
