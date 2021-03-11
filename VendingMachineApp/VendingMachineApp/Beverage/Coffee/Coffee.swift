//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class Coffee: Beverage {
    private let caffeinContent: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temparature: Int, calories: Int, isLowfat: Bool, caffeinContent: Int) {
        self.caffeinContent = caffeinContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, temparature: temparature, calories: calories)
    }
    
    func isDecaffeined(standard: Int) -> Bool {
        return self.caffeinContent < standard ? true : false
    }
    
    required init?(coder: NSCoder) {
        self.caffeinContent = coder.decodeInteger(forKey: "coffeeCaffeinContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(caffeinContent, forKey: "coffeeCaffeinContent")
        super.encode(with: coder)
    }
}
