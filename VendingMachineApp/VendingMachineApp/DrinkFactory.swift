//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/03.
//

import Foundation

class DrinkFactory {
    static func createDrink(for drinkType: Drink.Type) -> Drink? {
        switch drinkType {
        case is BananaMilk.Type:
            return BananaMilk(manufacturer: "빙그레", volume: 200, name: "빙그레바나나우유", manufacturedAt: Date(), price: 1000, temperature: 20, calorie: 200, fatContent: 5, farmCode: "B", expiredAt: Date())
        case is Cantata.Type:
            return Cantata(manufacturer: "롯데칠성음료", volume: 200, name: "칸타타프리미엄라떼", manufacturedAt: Date(), price: 2000, caffeineContent: 10, temperature: 100, calorie: 100, flavor: .latte, expiredAt: Date())
        case is Fanta.Type:
            return Fanta(manufacturer: "코카콜라컴퍼니", volume: 200, name: "환타", manufacturedAt: Date(), price: 1000, calorie: 100, packageMaterial: .can, temperature: 10, sugarContent: 10, expiredAt: Date())
        default:
            return nil
        }
    }
}
