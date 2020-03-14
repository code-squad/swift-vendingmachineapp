//
//  Cider.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Cider: Soda {
    enum Taste: String, CaseIterable {
        case lemon = "lemon"
        case pear = "pear"
    }
    
    private var taste: Taste
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature, taste: Taste) {
        self.taste = taste
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature)
    }
    
    enum Property: String, CustomStringConvertible {
        case taste
        
        var description: String {
            return self.rawValue
        }
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(taste.rawValue, forKey: "\(Property.taste)")
        super.encode(with: coder)
    }
    
    required init?(coder decoder: NSCoder) {
        if let taste = decoder.decodeObject(forKey: "\(Property.taste)") as? String {
            self.taste = Taste.init(rawValue: taste)!
        } else {
            self.taste = Taste.lemon
        }
        super.init(coder: decoder)
    }
    
    func isSameTaste(as taste: Taste) -> Bool {
        return self.taste == taste
    }
}
