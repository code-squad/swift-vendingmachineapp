//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Coffee : Beverage{
    
    private static let standard = 65
    
    private var caffeine : Int
    private var temperature : Int
    
    init(brand : String, capacity : Int, price : Int, name : String, createdAt : Date, expiredAt: Date, caffeine : Int, temperature : Int){
        self.caffeine = caffeine
        self.temperature = temperature
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt)
    }
    
    required init() {
        self.caffeine = 0
        self.temperature = Coffee.standard
        super.init()
    }
    required init?(coder: NSCoder) {
        self.caffeine = coder.decodeInteger(forKey: "CoffeeCaffeine")
        self.temperature = coder.decodeInteger(forKey: "temperature")
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(caffeine, forKey: "CoffeeCaffeine")
        coder.encode(temperature, forKey: "temperature")
        super.encode(with: coder)
    }
    override var description: String {
        return super.description + ", \(caffeine)mg"
    }
    func isHot() -> Bool{
        return Coffee.standard <= temperature
    }
}
