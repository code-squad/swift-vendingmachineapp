//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Coffee: Beverage {
    
    private var caffeineContent: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expiredAt: Date, calory: Int, caffeineContent: Int) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, temperature: temperature, expiredAt: expiredAt, calory: calory)
    }
    
    //MARK: encode 메소드, required init
    override func encode(with coder: NSCoder) {
        coder.encode(self.caffeineContent, forKey: "caffeineContent")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.caffeineContent = coder.decodeInteger(forKey: "caffeineContent")
        super.init(coder: coder)
    }
    
    func isDecaffeinated(caffeine: Int) -> Bool {
        return caffeineContent <= caffeine
    }
}
