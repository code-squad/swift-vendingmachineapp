//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/01.
//

import Foundation

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
    }
    
}

protocol addBeverage {
    static func addBeverage<T>(type sku: T, manufacturedAt: Date, expiration: Date) -> Beverage?
}
