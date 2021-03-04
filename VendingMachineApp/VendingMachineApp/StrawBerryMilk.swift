//
//  StrawBerryMilk.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class StrawBerryMilk : Milk{
    let StrawBerryContent : Int
    
    init(StrawBerryContent : Int, lowfat: Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.StrawBerryContent = StrawBerryContent
        super.init(lowfat: lowfat, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    override func addtoVendingMachine(vendingMachine: VendingMachine) {
        vendingMachine.addStrawBerryMilk(strawBerryMilk: self)
    }
}
