//
//  Diablo.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class Hot6 : Energydrink {
    private let taurineContent : Int
    
    init(taurineContent : Int, caffeineContent: Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.taurineContent = taurineContent
        super.init(caffeineContent: caffeineContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    required convenience init(manufactured: Date) {
        self.init(taurineContent: 40, caffeineContent: 30, brand: "코카콜라", volume: 180, price: 1900, name: "HOT6", manufactured: manufactured, temperature: 9, kcal: 20)
    }
    
    required init?(coder: NSCoder) {
        self.taurineContent = coder.decodeObject(forKey: "taurineContent") as? Int ?? 0
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.taurineContent, forKey: "taurineContent")
        super.encode(with: coder)
    }
    
    func isTaurine(standard : Int) -> Bool{
        return self.taurineContent > standard
    }
}
