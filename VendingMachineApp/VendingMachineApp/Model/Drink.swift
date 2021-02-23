//
//  Drink.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

class Drink: CustomStringConvertible {
    var description: String {
        return "\(brand), \(volume)ml, \(charge)원, \(name), \(manufacturing.convertToString())"
    }
    
    private let brand: String
    private let volume: Int
    private let charge: Int
    private let name: String
    private let manufacturing: Date
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturingDate : Date) {
        self.brand = brand
        self.volume = volume
        self.charge = charge
        self.name = name
        self.manufacturing = manufacturingDate
    }
}
