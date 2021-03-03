//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage: CustomStringConvertible, SafelyDrinkable {
    
    private(set) var brand: String
    private(set) var volume: Int
    private(set) var price: Int
    private(set) var name: String
    private let calorie: Int
    private let manufactured: Date?
    private let expiredAfter: Date?
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufactured?.formattedString ?? "")"
    }
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, manufactured: String, expiredAfter: String) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.calorie = calorie
        self.manufactured = manufactured.formattedDate
        self.expiredAfter = expiredAfter.formattedDate
    }
    
    func validate(with date: Date) -> Bool {
        if let expiredAfter = expiredAfter {
            return expiredAfter < date
        }
        return false
    }
}
