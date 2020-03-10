//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Beverage {
    
    private let brand: String
    private let name: String
    private let volume: Int
    private let price: Int
    private let manufacturingDate: Date
    
    init?(brand: String, volume: Int, price: Int,
          name: String, manufacturingDateInfo: String) {
        guard let manufacturingDate = Date.dateFormatter.date(from: manufacturingDateInfo)
            else {
                return nil
        }
        
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
    }
    
    func isBuyable(money: Int) -> Bool {
        return money >= price
    }
    
}

extension Beverage: Hashable {
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return  lhs.volume == rhs.volume &&
            lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(name + String(volume))
    }
    
}

extension Beverage: CustomStringConvertible {
    
    @objc var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturingDate.description)"
    }
    
}
