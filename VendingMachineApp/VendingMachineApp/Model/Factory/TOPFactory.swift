//
//  TOPFactory.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/10.
//

import Foundation

class TOPFactory {
    static func createBeverage() -> Beverage {
        return TOP(brand: "맥심", capacity: 240, price: 1500, name: "티오피", manufacturedAt: Date.input("20210301"), expirationAt: Date.input("20210310"), temperature: 5, caffeineContent: 50, flavor: TOP.Flavor.americano)
    }
}
