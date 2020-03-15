//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

extension Beverage {
    
    struct Kind: Hashable {
        
        private let name: String
        private let volume: Int
        
        init(name: String, volume: Int) {
            self.name = name
            self.volume = volume
        }
        
        func hash(into hasher: inout Hasher) {
            return hasher.combine(name + String(volume))
        }
        
    }
    
}

class Beverage {
    
    private let brand: String
    private let name: String
    private let volume: Int
    private let manufacturingDate: Date
    let price: Int
    let kind: Kind
    
    init?(brand: String,
          volume: Int,
          price: Int,
          name: String,
          manufacturingDateInfo: String) {
        guard let manufacturingDate = Date.dateFormatter.date(from: manufacturingDateInfo)
            else {
                return nil
        }
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
        self.kind = Kind(name: self.name, volume: self.volume)
    }
    
}

extension Beverage: Equatable {
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.kind == rhs.kind
    }
    
}

extension Beverage: CustomStringConvertible {
    
    @objc var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name)" +
        ", \(manufacturingDate.toStringYearMonthDay)"
    }
    
}

