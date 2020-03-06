//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Beverage {
    
    let brand: String
    let volume: Int
    let price: Int
    let name: String
    var manufacturingDate: Date
    static let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier:"ko_KR")
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
    
    init?(brand: String, volume: Int, price: Int,
          name: String, dateInfo: String) {
        guard let date = Beverage.dateFormatter.date(from: dateInfo) else {
            return nil
        }
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturingDate = date
    }
    
}

extension Beverage: CustomStringConvertible {
    
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(Beverage.dateFormatter.string(from: manufacturingDate))"
        
    }
}
