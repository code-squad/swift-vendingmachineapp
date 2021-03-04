//
//  Monster.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class Monster : Energydrink {
    let glutamineContent : Int
    
    init(glutamineContent : Int, caffeine: Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.glutamineContent = glutamineContent
        super.init(caffeine: caffeine, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    override func addtoVendingMachine(vendingMachine: VendingMachine) {
        vendingMachine.addMonster(monster: self)
    }
}
