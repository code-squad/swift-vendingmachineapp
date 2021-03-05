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
    
}
