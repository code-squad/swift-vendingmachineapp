//
//  StrawBerryMilk.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class StrawBerryMilk : Milk{
    private let StrawBerryContent : Int
    private let HIGHCONTENT : Int
    
    init(StrawBerryContent : Int, lowfat: Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.StrawBerryContent = StrawBerryContent
        self.HIGHCONTENT = 30
        super.init(lowfat: lowfat, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }

    func isHighContent() -> Bool {
        return self.StrawBerryContent > self.HIGHCONTENT
    }
}
