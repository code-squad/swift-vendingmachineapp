//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Coffee : Beverage {
    private var caffeineContent : Int
    
    init(caffeineContent : Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature:temperature, kcal: kcal)
    }
    
    convenience init(caffeineContent : Int, caffeine : Bool, brand: String, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int){ //short size coffee
        self.init(caffeineContent : caffeineContent, brand: brand, volume: 236, price: price, name: name, manufactured: manufactured, temperature:temperature, kcal: kcal)
    }
    
    required init(manufactured: Date) {
        self.caffeineContent = 0
        super.init(manufactured: manufactured)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.caffeineContent,forKey: "caffeineContent")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.caffeineContent = coder.decodeInteger(forKey: "caffeineContent")
        super.init(coder: coder)
    }
    
    func isCaffeine(standard : Int) -> Bool{
        return self.caffeineContent > standard
    }
}
