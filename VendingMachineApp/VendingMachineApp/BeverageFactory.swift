//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/01.
//

import Foundation

//팩토리 메서드 패턴
protocol BeverageFactory {
    func create() -> Beverage
}

class MilkFactory: BeverageFactory {
    func create() -> Beverage {
        BananaMilk(brand: "빙그레", capacity: 400, price: 2000, name: "바나나우유",manufacture: Date(), farmCode: "A", hasDoraemonSticker: false, expiry: Date()+1)
    }
}

class SodaFactory: BeverageFactory {
    func create() -> Beverage {
        Coke(brand: "코카콜라", capacity: 200, price: 1000, name: "콜라",manufacture: Date(), taste: .lemon, hasCalorie: true)
    }
}

class CoffeeFactory: BeverageFactory {
    func create() -> Beverage {
        Top(brand: "맥심", capacity: 300, price: 1000, name: "탑",manufacture: Date(), isHot: true, hasSugar: false)
    }
}
