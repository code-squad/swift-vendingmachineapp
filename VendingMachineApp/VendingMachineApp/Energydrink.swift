//
//  Energydrink.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Energydrink : Beverage {
    private var caffeineContent : Int
    
    init(caffeineContent : Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int){
        self.caffeineContent = caffeineContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    convenience init(brand: String, volume: Int, price: Int, name: String, manufactured: Date, kcal : Int){ //카페인 있는 에너지 드링크
        self.init(caffeineContent: 30, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: 5, kcal: kcal)
    }
    
    required init(manufactured: Date) {
        caffeineContent = 0
        super.init(manufactured: manufactured)
    }
    
    required init?(coder: NSCoder) {
        self.caffeineContent = coder.decodeObject(forKey: "caffeineContent") as? Int ?? 0
        super.init(coder: coder)
    }

    override func encode(with coder: NSCoder) {
        coder.encode(self.caffeineContent, forKey: "caffeineContent")
        super.encode(with: coder)
    }
    
    func isdecaffeine(standard : Int) -> Bool{
        return caffeineContent < standard
    }
}
