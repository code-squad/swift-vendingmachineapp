//
//  BeverageMenu.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum BeverageMenu {
    case bananaMilk
    case strawberryMilk
    case cocaCola
    case pepsi
    case georgia
    case top
    
    func makeInstance() -> Beverage {
        switch self {
        case .bananaMilk:
            return BananaMilk(brand: "빙그레", volume: 250, price: Money(1500), productName: "바나나우유",
                              expiryDate: DateUtility.addDays(7), calorie: 300)
        case .cocaCola:
            return CocaCola(brand: "코카콜라", volume: 500, price: Money(1430), productName: "코카콜라",
                            expiryDate: DateUtility.addDays(5), calorie: 250)
        case .georgia:
            return Georgia(brand: "코카콜라", volume: 240, price: Money(1100),
                           productName: "조지아 오리지널", expiryDate: DateUtility.addDays(1), calorie: 94, isHot: false)
        case .pepsi:
            return Pepsi(brand: "펩시콜라", volume: 355, price: Money(1200), productName: "펩시",
                         expiryDate: DateUtility.subtractDays(7), calorie: 275)
        case .strawberryMilk:
            return StrawberryMilk(brand: "빙그레", volume: 355, price: Money(1200), productName: "딸기우유",
                                  expiryDate: DateUtility.addDays(3), calorie: 275)
        case .top:
            return TOP(brand: "맥심", volume: 275, price: Money(1800), productName: "TOP 스위트아메리카노",
                       expiryDate: DateUtility.subtractDays(1), calorie: 48, isHot: true)
        }
    }
    
    static func filterExpireDateOnToday() -> [BeverageMenu] {
        return self.filter({ beverageMene -> Bool in
            return beverageMene.makeInstance().isExpired(with: DateUtility.today())
        })
    }
    
    static func filterHottedBeverages() -> [BeverageMenu] {
        return self.filter({ beverageMene -> Bool in
            guard let coffee = beverageMene.makeInstance() as? Coffee else {
                return false
            }
            
            return coffee.isHot
        })
    }
}

extension BeverageMenu {
    private static var allValues: [BeverageMenu] {
        return [.bananaMilk, .cocaCola, .georgia, .pepsi, .strawberryMilk, .top]
    }
    
    static func map<T>(_ function: ((BeverageMenu) -> T)) -> [T] {
        return allValues.map(function)
    }
    
    static func filter(_ function: ((BeverageMenu) -> Bool)) -> [BeverageMenu] {
        return allValues.filter(function)
    }
    
    static func forEach(_ function: ((BeverageMenu) -> Void)) {
        allValues.forEach(function)
    }
    
    static func getBeverageMenu(index: Int) -> BeverageMenu {
        return allValues[index]
    }
}
