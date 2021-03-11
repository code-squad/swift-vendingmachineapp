//
//  SodaFactory.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/09.
//

import Foundation

class SodaFactory: addBeverage {
    
    static func addBeverage<T>(type sku: T, manufacturedAt: Date, expiration: Date) -> Beverage? {
        switch sku {
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
