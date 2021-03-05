//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/01.
//

import Foundation

<<<<<<< HEAD
class BeverageFactory: addBeverage {
    
    static func addBeverage<T>(type sku: T, manufacturedAt: Date, expiration: Date) -> Beverage? {
        switch sku {
        case is CantataAmericano.Type:
            return CantataAmericano(manufacturedAt: manufacturedAt, expiration: expiration)
        case is CantataLatte.Type:
            return CantataLatte(manufacturedAt: manufacturedAt, expiration: expiration)
        case is BlueBottle.Type:
            return BlueBottle(manufacturedAt: manufacturedAt, expiration: expiration)
        case is SeoulSterilized.Type:
            return SeoulSterilized(manufacturedAt: manufacturedAt, expiration: expiration)
        case is SeoulStrawberry.Type:
            return SeoulStrawberry(manufacturedAt: manufacturedAt, expiration: expiration)
        case is SeoulChoco.Type:
            return SeoulChoco(manufacturedAt: manufacturedAt, expiration: expiration)
        case is DrPepper.Type:
            return DrPepper(manufacturedAt: manufacturedAt, expiration: expiration)
        case is FantaOrange.Type:
            return FantaOrange(manufacturedAt: manufacturedAt, expiration: expiration)
        case is Sprite.Type:
            return Sprite(manufacturedAt: manufacturedAt, expiration: expiration)
        default:
            return nil
        }
=======
class BeverageFactory {
    
    func addBeverage(manufacturedAt: Date, expiration: Date) -> Beverage {
        
        return CantataAmericano(manufacturedAt: manufacturedAt, expiration: expiration)
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
    }
    
}

protocol addBeverage {
<<<<<<< HEAD
    static func addBeverage<T>(type sku: T, manufacturedAt: Date, expiration: Date) -> Beverage?
=======
    func addBeverage(specific: a.Type, manufacturedAt: Date, expiration: Date) -> Beverage?
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
}
