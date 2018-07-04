//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    private var temperature: Int
    
    override init(name: String, price: Int, country: String) {
        self.temperature = 90
        super.init(name: name, price: price, country: country)
    }
    
    convenience init() {
        self.init(name: DefaultData.cantata.name, price: DefaultData.cantata.price, country: "인도네시아")
    }
    
    private struct NSCoderKeys {
        static let temperatureKey = "temperature"
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(NSNumber(value: temperature), forKey: NSCoderKeys.temperatureKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let temperature = aDecoder.decodeObject(of: NSNumber.self, forKey: NSCoderKeys.temperatureKey) else {
            return nil
        }
        self.temperature = temperature.intValue
        super.init(coder: aDecoder)
    }
}
