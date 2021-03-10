//
//  RedBullFactory.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/10.
//

import Foundation

class RedBullFactory: Produceable {
    func createBeverage() -> Beverage {
        return RedBull(brand: "레드불", capacity: 500, price: 1200, name: "레드불", manufacturedAt: Date.input("20210301"), expirationAt: Date.input("20210310"), temperature: 5, taurineContent: 2000, vitaminB: 5)
    }
}
