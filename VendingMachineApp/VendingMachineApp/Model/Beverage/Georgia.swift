//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    private var black: Bool
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature, decaffeinated: Bool, black: Bool) {
        self.black = black
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, decaffeinated: decaffeinated)
    }
    
    enum Property: String, CustomStringConvertible {
        case black
        
        var description: String {
            return self.rawValue
        }
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(black, forKey: "\(Property.black)")
        super.encode(with: coder)
    }
    
    required init?(coder decoder: NSCoder) {
        self.black = decoder.decodeBool(forKey: "\(Property.black)")
        super.init(coder: decoder)
    }
    
    func isBlack() -> Bool {
        return black
    }
}
