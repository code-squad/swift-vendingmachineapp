//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Beverage
}

class DenmarkStrawberryMilkFactory: BeverageFactory {
    
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Beverage {
        return FlavoredMilk(brand: "동원F&B", volume: 300, price: 1000, name: "덴마크 딸기딸기 우유", calorie: 220, manufactured: manufactured, expiredAfter: expiredAfter, lactoseAmount: 15, flavor: .strawberry)
    }
}

class MaeilChocolateMilkFactory: BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Beverage {
        return FlavoredMilk(brand: "매일유업", volume: 190, price: 900, name: "소화가 잘되는 우유 초콜릿", calorie: 150, manufactured: manufactured, expiredAfter: expiredAfter, lactoseAmount: 0, flavor: .chocolate)
    }
}

class ZeroSugarCokeFactory: BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Beverage {
        return ZeroCalorieSoftDrink(brand: "코카콜라", volume: 250, price: 1000, name: "코카콜라 제로", manufactured: manufactured, expiredAfter: expiredAfter, isCarbonated: true)
    }
}

class GeorgiaMaxFactory: BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Beverage {
        return Coffee(brand: "코카콜라", volume: 240, price: 800, name: "조지아 맥스", calorie: 121, manufactured: manufactured, expiredAfter: expiredAfter, servingTemperature: 55, caffeineAmount: 117)
    }
}

class RedBullFactory: BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Beverage {
        return EnergyDrink(brand: "레드불", volume: 250, price: 1900, name: "레드불 에너지 드링크", calorie: 112, manufactured: manufactured, expiredAfter: expiredAfter, caffeineAmount: 62, isCarbonated: true)
    }
}
