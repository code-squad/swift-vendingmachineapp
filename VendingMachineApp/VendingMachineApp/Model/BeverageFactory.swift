//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/04.
//

import Foundation

class BeverageFactory {
    static let shared = BeverageFactory()
    
    func createBeverage(with beverageType: BeverageType) -> Productable {
        switch beverageType {
        case .cola:
            return Cola(brand: "코카콜라", capacity: 500, price: 1000, name: "콜라", manufacturedAt: Date.input("20210302"), expirationAt: Date.input("20210310"), temperature: 5, glycemicIndex: 50, packageAttribute: Cola.Package.can)
        case .strawberrymilk:
            return StrawBerryMilk(brand: "서울우유", capacity: 300, price: 800, name: "딸기우유", manufacturedAt: Date.input("20210302"), expirationAt: Date.input("20210310"), temperature: 5, pH: 6.5, color: StrawBerryMilk.Color.red)
        case .redbull:
            return RedBull(brand: "RedBull", capacity: 250, price: 1000, name: "레드불", manufacturedAt: Date.input("20210302"), expirationAt: Date.input("20210310"), temperature: 5, taurineContent: 1000, vitaminB: 2)
        case .top:
            return TOP(brand: "동서식품", capacity: 380, price: 2000, name: "TOP", manufacturedAt: Date.input("20210222"), expirationAt: Date.input("20210301"), temperature: 65, caffeineContent: 94, flavor: TOP.Flavor.americano)
        }
    }
}

enum BeverageType {
    case cola, strawberrymilk, redbull, top
}
