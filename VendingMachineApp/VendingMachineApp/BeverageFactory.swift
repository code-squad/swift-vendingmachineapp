//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol BeverageFactory {

    func create(type: Beverage.Type) -> Beverage?
    
    func createAll() -> [Beverage]

}

class BeverageFactory0303: BeverageFactory {
    
    private let allTypes: [Beverage.Type] = [Americano.self, CafeLatte.self, Chocolate.self, Coke.self, Milkis.self, Plain.self]
    
    func create(type: Beverage.Type) -> Beverage? {
        switch type {
        case is Americano.Type:
            return Americano.init(brand: "스타벅스", name: "블랙커피", price: 1800, size: 275,
                                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                                  temperature: 75.5, package: .bottle, sugar: 0.0)
        case is CafeLatte.Type:
            return CafeLatte.init(brand: "코카콜라", name: "조지아 카페라떼", price: 900, size: 240,
                                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                                  temperature: 8.5, package: .can, expireAfter: 10, lactose: 3.5)
        case is Chocolate.Type:
            return Chocolate.init(brand: "푸르밀", name: "가나 초코우유", price: 1300, size: 225,
                                       dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                                       expireAfter: 10, lactose: 3.5, package: .bottle)
        case is Coke.Type:
            return Coke.init(brand: "코카콜라", name: "코카콜라 제로", price: 2000, size: 500,
                             dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                             package: .bottle , sugar: 0.0)
        case is Milkis.Type:
            return Milkis.init(brand: "", name: "밀키스", price: 1500, size: 340,
                               dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                               package: .can, lactose: 3.5)
        case is Plain.Type:
            return Plain.init(brand: "매일", name: "소화가 잘되는 우유", price: 850, size: 190,
                              dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                              expireAfter: 7, lactose: 0.2, sugar: 0.2)
        default:
            return nil
        }
    }
    
    func createAll() -> [Beverage] {
        var beverages = [Beverage]()
        
        allTypes.forEach { (beverage) in
            if let created = create(type: beverage) {
                beverages.append(created)
            }
        }
        return beverages
    }
}
