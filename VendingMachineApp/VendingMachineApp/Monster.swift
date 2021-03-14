//
//  Monster.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class Monster : Energydrink {
    private let glutamineContent : Int
    
    init(glutamineContent : Int, caffeineContent: Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.glutamineContent = glutamineContent
        super.init(caffeineContent: caffeineContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    required convenience init(manufactured: Date) {
        self.init(glutamineContent: 10, caffeineContent: 30, brand: "코카콜라", volume: 180, price: 2100, name: "몬스터", manufactured: manufactured, temperature: 5, kcal: 30)
    }
    
    
}
