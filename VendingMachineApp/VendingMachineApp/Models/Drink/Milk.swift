//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Milk: Drink {
    private let fatContent: Int
    
    init(manufacturer: String, volume: Int, name: String, manufacturedAt: Date, price: Int, temperature: Int, calorie: Int, fatContent: Int, expiredAt: Date) {
        self.fatContent = fatContent
        super.init(manufacturer: manufacturer, volume: volume, name: name, manufacturedAt: manufacturedAt, price: price, temperature: temperature, calorie: calorie, expiredAt: expiredAt)
    }
    
    required init?(coder: NSCoder) {
        self.fatContent = coder.decodeInteger(forKey: "fatContent")
        super.init(coder: coder)
    }
    
    required init() {
        self.fatContent = 0
        super.init()
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(fatContent, forKey: "fatContent")
        super.encode(with: coder)
    }
    
    func isLowFat(standard: Int) -> Bool {
        return fatContent < standard
    }
}
