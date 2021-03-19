//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Product
}

class DenmarkStrawberryMilkFactory: BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Product {
        return Product(brand: "동원F&B",
                       beverage: FlavoredMilk(volume: 300, calorie: 220, manufactured: manufactured, expiredAfter: expiredAfter, lactoseAmount: 15, flavor: .strawberry),
                       name: "덴마크 딸기딸기 우유",
                       price: 1000,
                       packaging: "denmarkStrawberryMilk")
    }
}

class MaeilChocolateMilkFactory: BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Product {
        return Product(brand: "매일유업",
                       beverage: FlavoredMilk(volume: 190, calorie: 150, manufactured: manufactured, expiredAfter: expiredAfter, lactoseAmount: 0, flavor: .chocolate),
                       name: "소화가 잘되는 우유 초콜릿",
                       price: 900,
                       packaging: "maeilChocolateMilk")
    }
}

class ZeroSugarCokeFactory: BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Product {
        return Product(brand: "코카콜라",
                       beverage: ZeroCalorieSoftDrink(volume: 250, manufactured: manufactured, expiredAfter: expiredAfter, isCarbonated: true),
                       name: "코카콜라 제로",
                       price: 1000,
                       packaging: "zeroSugarCoke")
    }
}

class GeorgiaMaxFactory: BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Product {
        return Product(brand: "코카콜라",
                       beverage: Coffee(volume: 240, calorie: 121, manufactured: manufactured, expiredAfter: expiredAfter, servingTemperature: 55, caffeineAmount: 117),
                       name: "조지아 맥스",
                       price: 800,
                       packaging: "georgiaMax")
    }
}

class RedBullFactory: BeverageFactory {
    func createProduct(manufactured: Date?, expiredAfter: Date?) -> Product {
        return Product(brand: "레드불",
                       beverage: EnergyDrink(volume: 250, calorie: 112, manufactured: manufactured, expiredAfter: expiredAfter, caffeineAmount: 62, isCarbonated: true),
                       name: "레드불 에너지 드링크",
                       price: 1900,
                       packaging: "redBull")
    }
}
