//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private var juiceContent: Double
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, farmCode: FarmCode, temperature: Temperature, juiceContent: Double) {
        self.juiceContent = juiceContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, farmCode: farmCode)
    }
    
    enum Property: String, CustomStringConvertible {
        case juiceContent
        
        var description: String {
            return self.rawValue
        }
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(juiceContent, forKey: "\(Property.juiceContent)")
        super.encode(with: coder)
    }
    
    required init?(coder decoder: NSCoder) {
        self.juiceContent = decoder.decodeDouble(forKey: "\(Property.juiceContent)")
        super.init(coder: decoder)
    }
    
    func isHigher(than juiceContent: Double) -> Bool {
        return self.juiceContent > juiceContent
    }
}
