//
//  Protocol.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/09.
//

import Foundation

protocol addBeverage {
    static func addBeverage<T>(type sku: T, manufacturedAt: Date, expiration: Date) -> Beverage?
}
