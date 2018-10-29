//
//  WareHouse.swift
//  VendingMachine
//
//  Created by 이동건 on 24/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum BeverageType: String, CaseIterable, CustomStringConvertible {
    var description: String {
        switch self {
        case .fruitMilk:
            return "바나나가듬뿍"
        case .chocolateMilk:
            return "초코가한가득"
        case .beer:
            return "카스"
        case .ricewine:
            return "금정산성막걸리"
        case .latte:
            return "TOP라때"
        case .affogato:
            return "바닐라아포가토"
        }
    }
    
    var className: String {
        return self.beverage.className
    }
    
    var beverage: Beverage {
        let date = Date(timeIntervalSinceNow: Date.convert(weeks: -Int.random(in: 1...3)))
        switch self {
        case .fruitMilk:
            return FruitMilk(fruit: .banana, fat: 0.3, code: "강원03-21", brand: "서울우유", volume: 250, price: 3000, name: "바나나가듬뿍", date: date)
        case .chocolateMilk:
            return ChocolateMilk(chocolate: 0.3, fat: 0.4, code: "강원12-67", brand: "서울우유", volume: 250, price: 3000, name: "초코가한가득", date: date)
        case .beer:
            return Beer(malt: 0.2, alcohol: 0.14, brand: "OB맥주", volume: 300, price: 5000, name: "카스", date: date)
        case .ricewine:
            return RiceWine(area: .busan, alcohol: 0.2, brand: "금정산성토산주", volume: 400, price: 7000, name: "금정산성막걸리", date: date)
        case .latte:
            return Latte(milk: 0.2, art: .flower, caffeine: 0.3, brand: "맥심", volume: 125, price: 4000, name: "TOP라때", date: date)
        case .affogato:
            return Affogato(iceCream: .vanilla, caffeine: 0.2, brand: "투썸플레이스", volume: 300, price: 6500, name: "바닐라아포가토", date: date)
        }
    }
    case fruitMilk = "1"
    case chocolateMilk = "2"
    case beer = "3"
    case ricewine = "4"
    case latte = "5"
    case affogato = "6"
}

class WareHouse {
    
    static var items: String {
        var items = ""
        BeverageType.allCases.enumerated().forEach {
            items += "\($0.offset + 1)) \($0.element)\n"
        }
        items += "> "
        return items
    }
    
    static func generateBeverage(by className: String) -> Beverage {
        return BeverageType.allCases.filter { $0.className == className }.first!.beverage
    }
    static func generateBeverages(_ count: Int) -> [Beverage] {
        var beverages: [Beverage] = []
        for _ in 0..<count {
            let index = Int.random(in: 1...BeverageType.allCases.count)
            let casted = String(index)
            beverages.append(generateBeverage(casted))
        }
        return beverages
    }
    
    private static func generateBeverage(_ index: String) -> Beverage {
        return BeverageType(rawValue: index)!.beverage
    }
}
