//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    private var manufacturer: String
    private var volume: Int
    private var price: Int
    private var skuName: String
    private var manufactureDate: Date
    
    init(manufacturer: String, volume: Int, price: Int, skuName: String, manufactureDate: Date) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.price = price
        self.skuName = skuName
        self.manufactureDate = manufactureDate
    }
    
    var description: String {
        return "\(manufacturer), \(volume), \(price), \(skuName), \(manufactureDate)"
    }
    
}

extension Date {
    
    func dateFormatter(date: String) -> Date {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        var targetDate = Date()
        if let someDate = dateFormat.date(from: date) {
            targetDate = someDate
        }
        return targetDate
    }
    
}
