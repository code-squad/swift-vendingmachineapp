//
//  Milk.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    
    private var fatContent: Double
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expiredAt: Date, calory: Int, fatContent: Double) {
        self.fatContent = fatContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, temperature: temperature, expiredAt: expiredAt, calory: calory)
    }
    
    //MARK: encode 메소드, required init
    override func encode(with coder: NSCoder) {
        coder.encode(self.fatContent, forKey: "fatContent")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.fatContent = coder.decodeDouble(forKey: "fatContent")
        super.init(coder: coder)
    }
    
    func isLowFat(fat: Double) -> Bool {
        return fatContent <= fat
    }
}
