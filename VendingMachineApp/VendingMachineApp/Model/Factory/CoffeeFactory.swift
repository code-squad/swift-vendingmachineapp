//
//  CoffeeFactory.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/09.
//

import Foundation

class CoffeeFactory: addBeverage {
    
    static func addBeverage<T>(type sku: T, manufacturedAt: Date, expiration: Date) -> Beverage? {
        switch sku {
        case is CantataAmericano.Type:
            return CantataAmericano(manufacturedAt: manufacturedAt, expiration: expiration)
        case is CantataLatte.Type:
            return CantataLatte(manufacturedAt: manufacturedAt, expiration: expiration)
        case is BlueBottle.Type:
            return BlueBottle(manufacturedAt: manufacturedAt, expiration: expiration)
        default:
            return nil
        }
    }
}
