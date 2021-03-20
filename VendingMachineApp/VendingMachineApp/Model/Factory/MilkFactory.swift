//
//  MilkFactory.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/09.
//

import Foundation

class MilkFactory: addBeverage {
    
    static func addBeverage<T>(type sku: T, manufacturedAt: Date, expiration: Date) -> Beverage? {
        switch sku {
        case is SeoulSterilized.Type:
            return SeoulSterilized(manufacturedAt: manufacturedAt, expiration: expiration)
        case is SeoulStrawberry.Type:
            return SeoulStrawberry(manufacturedAt: manufacturedAt, expiration: expiration)
        case is SeoulChoco.Type:
            return SeoulChoco(manufacturedAt: manufacturedAt, expiration: expiration)
        default:
            return nil
        }
    }
    
    let something = type(of: CantataAmericano(manufacturedAt: Date().stringToDate(date: "2021-02-02"), expiration: Date().stringToDate(date: "2021-02-02")))
    
    
    
}



