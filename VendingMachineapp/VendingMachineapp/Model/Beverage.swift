//
//  Beverage.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class Beverage{
    private var manufacturer: String
    private var volume: Int
    private var price: Int
    private var brand: String
    private var manufactoringDate: Date
    
    init() {
        self.manufacturer = ""
        self.volume = 0
        self.price = 0
        self.brand = ""
        self.manufactoringDate = Date()
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let dateString = formatter.string(from: manufactoringDate)
        return "\(manufacturer), \(volume)ml, \(price)원, \(brand), \(dateString)"
    }
}
