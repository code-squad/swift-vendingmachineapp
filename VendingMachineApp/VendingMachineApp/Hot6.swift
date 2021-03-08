//
//  Diablo.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class Hot6 : Energydrink {
    private let taurineContent : Int
    private var taurine : Bool = false
    
    init(taurineContent : Int, caffeineContent: Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.taurineContent = taurineContent
        super.init(caffeineContent: caffeineContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
        self.taurine = isTaurine()
    }
    
    private func isTaurine() -> Bool{
        return self.taurineContent > 0
    }
}
