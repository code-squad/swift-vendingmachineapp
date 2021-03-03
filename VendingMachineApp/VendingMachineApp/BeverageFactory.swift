//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol BeverageFactory {

    func create() -> Beverage

}

enum BeverageFactory0303: BeverageFactory, CaseIterable {
    case americano, cafelatte, chocolateMilk, coke, milkis, plainMilk
    
    func create() -> Beverage {
        switch self {
        case .americano:
            return Americano.init(brand: "스타벅스", name: "블랙커피", price: 1800, size: 275,
                                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                                  temperature: 75.5, package: .bottle, sugar: 0.0)
        case .cafelatte:
            return CafeLatte.init(brand: "코카콜라", name: "조지아 카페라떼", price: 900, size: 240,
                                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                                  temperature: 8.5, package: .can, expireAfter: 10, lactose: 3.5)
        case .chocolateMilk:
            return Chocolate.init(brand: "푸르밀", name: "가나 초코우유", price: 1300, size: 225,
                                       dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                                       expireAfter: 10, lactose: 3.5, package: .bottle)
        case .coke:
            return Coke.init(brand: "코카콜라", name: "코카콜라 제로", price: 2000, size: 500,
                             dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                             package: .bottle , sugar: 0.0)
        case .milkis:
            return Milkis.init(brand: "", name: "밀키스", price: 1500, size: 340,
                               dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                               package: .can, lactose: 3.5)
        case .plainMilk:
            return Plain.init(brand: "매일", name: "소화가 잘되는 우유", price: 850, size: 190,
                              dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                              expireAfter: 7, lactose: 0.2, sugar: 0.2)
        }
    }
}
