//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Beverage {
    private let brand: String
    private let size: Int
    private let price: Int
    private let name: String
    private let packDate: Date
    
    public init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String) {
        brand = brandName
        size = sizeInMilliliter
        price = itemPrice
        name = itemName
        packDate = Date()
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(size)ml, \(price)원, \(name), \(packDate.useSimpleFormat())"
    }
}

extension Beverage: Drinkable {
    func validate(with date: Date) -> Bool {
        return true
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return false
    }
}

extension Date {
    func useSimpleFormat() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        return format.string(from: self)
    }
}
