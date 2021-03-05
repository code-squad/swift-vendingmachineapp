//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/03.
//

import Foundation

class DrinkFactory {
    static func createDrink(for drink: Drink.Type) -> Drink? {
        if drink == Cantata.self {
            return Cantata(manufacturer: "롯데칠성음료", volume: 200, name: "칸타타프리미엄라떼", manufacturedAt: Date(), price: 2000, caffeineContent: 10, temperature: 100, calorie: 100, flavor: .latte, expiredAt: Date())
        } else if drink == BananaMilk.self {
            return BananaMilk(manufacturer: "빙그레", volume: 200, name: "빙그레바나나우유", manufacturedAt: Date(), price: 1000, temperature: 20, calorie: 200, fatContent: 5, farmCode: "B", expiredAt: Date())
        } else if drink == Fanta.self {
            return Fanta(manufacturer: "코카콜라컴퍼니", volume: 200, name: "Fanta", manufacturedAt: Date(), price: 1000, calorie: 100, packageMaterial: .can, temperature: 10, sugarContent: 10, expiredAt: Date())
        }
        return nil
    }
}
