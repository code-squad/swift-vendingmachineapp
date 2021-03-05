//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class BananaMilk : Milk{
    private let sugarContent : Int
    
    init(sugarContent : Int, lowfat: Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.sugarContent = sugarContent
        super.init(lowfat: lowfat, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    func isSugarfree() -> Bool {
        return sugarContent < 1
    }
}
