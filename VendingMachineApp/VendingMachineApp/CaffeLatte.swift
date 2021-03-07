//
//  CaffeLatte.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class CaffeeLatte : Coffee{
    private let sugarContent : Int
    private var sugar : Bool = false
    
    init(sugarContent : Int, caffeineContent: Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.sugarContent = sugarContent
        super.init(caffeineContent: caffeineContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
        sugar = isSugarfree()
    }
    
    private func isSugarfree() -> Bool {
        return self.sugarContent < 1
    }
}
