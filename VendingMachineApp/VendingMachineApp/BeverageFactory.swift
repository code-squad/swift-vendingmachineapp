//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/01.
//

import Foundation

//팩토리 메서드 패턴
protocol BeverageFactory {
    static func create() -> Beverage
}

class MilkFactory: BeverageFactory {
    static func create() -> Beverage {
        BananaMilk(brand: "빙그레", capacity: 400, price: 2000, name: "바나나우유",manufacture: Date(), farmCode: "A", hasDoraemonSticker: false)
    }
}

class SodaFactory: BeverageFactory {
    static func create() -> Beverage {
        Coke(brand: "코카콜라", capacity: 200, price: 1000, name: "콜라",manufacture: Date(), taste: "레몬맛", calorie: 5, expiredAt: Calendar.current.date(byAdding: .day, value: 180, to: Date())!)
    }
}

class CoffeeFactory: BeverageFactory {
    static func create() -> Beverage {
        Top(brand: "맥심", capacity: 300, price: 1000, name: "탑",manufacture: Date(), temperature: 70, hasSugar: false, expiredAt: Calendar.current.date(byAdding: .day, value: 30, to: Date())!)
    }
}

class FactoryManager {
    static func create(type: BeverageFactory.Type) -> Beverage {
        return type.self.create()
    }
}
