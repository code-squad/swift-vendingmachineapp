//
//  Drink.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

class Drink: DrinkProtocol {
    var description: String {
        return "\(brand), \(volume)ml, \(charge)원, \(name), \(manufacturingDate.convertDate2yyyymmddString())"
    }
    
    let brand: String
    let volume: Int
    let charge: Int
    let name: String
    let manufacturingDate: Date
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturingDate : Date) {
        self.brand = brand
        self.volume = volume
        self.charge = charge
        self.name = name
        self.manufacturingDate = manufacturingDate
    }
}

extension Date {
    func convertDate2yyyymmddString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(for: self) ?? "00000000"
    }
}

