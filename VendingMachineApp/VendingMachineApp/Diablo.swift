//
//  Diablo.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class Diablo : Energydrink {
    let taurine : Bool
    
    init(taurine : Bool, caffeine: Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.taurine = taurine
        super.init(caffeine: caffeine, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
}
