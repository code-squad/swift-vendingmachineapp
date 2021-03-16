//
//  CaffeMocha.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class CaffeMocha : Coffee{
    private let cream : Bool
    
    init(cream : Bool, caffeineContent: Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.cream = cream
        super.init(caffeineContent: caffeineContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    required convenience init(manufactured: Date) {
        self.init(cream: true, caffeineContent: 30, brand: "스타벅스", volume: 236, price: 3600, name: "카페모카", manufactured: manufactured, temperature: 90, kcal: 330)
    }
    
    required init?(coder: NSCoder) {
        self.cream = coder.decodeBool(forKey: "cream")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.cream, forKey: "cream")
        super.encode(with: coder)
    }
    
    
}
