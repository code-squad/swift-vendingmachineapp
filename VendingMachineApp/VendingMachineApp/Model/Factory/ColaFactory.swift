//
//  ColaFactory.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/10.
//

import Foundation

class ColaFactory {
    static func createBeverage() -> Beverage {
        return Cola(brand: "코카콜라", capacity: 500, price: 1000, name: "콜라", manufacturedAt: Date.input("20210301"), expirationAt: Date.input("20210310"), temperature: 5, glycemicIndex: 50, packageAttribute: Cola.Package.can)
    }
}
