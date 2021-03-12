//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/09.
//

import Foundation

protocol Factory {
    static func makeBeverage() -> Beverage
}

class CoffeeFactory: Factory {
    static func makeBeverage() -> Beverage {
        return Cantata(brand: "롯데칠성음료", volume: 175, price: 1000, name: "칸타타", manufacturedAt: Date.convertToDate("20210301"), temperature: 65.0, expiredAt: Date.convertToDate("20211201"), calory: 50, caffeineContent: 5, beanOrigin: .colombia)
    }
}

class MilkFactory: Factory {
    static func makeBeverage() -> Beverage {
        return StrawberryMilk(brand: "서울우유", volume: 200, price: 800, name: "딸기우유", manufacturedAt: Date.convertToDate("20210309"), temperature: 5.0, expiredAt: Date.convertToDate("20210316"), calory: 130, fatContent: 15, farmCode: .A)
    }
}

class SodaFactory: Factory {
    static func makeBeverage() -> Beverage {
        return Coke(brand: "코카콜라", volume: 250, price: 1200, name: "콜라", manufacturedAt: Date.convertToDate("20210301"), temperature: 5.0, expiredAt: Date.convertToDate("20220101"), calory: 200, sugarContent: 30, package: .can)
    }
}

class BeverageFactory {
    func addToInventory(beverage: Factory.Type) -> Beverage {
        return beverage.makeBeverage()
    }
}


