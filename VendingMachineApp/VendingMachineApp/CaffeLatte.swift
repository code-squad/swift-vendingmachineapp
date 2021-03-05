//
//  CaffeLatte.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class CaffeeLatte : Coffee{
    private let sugarContent : Int
    private var sugar : Bool
    
    init(sugarContent : Int, caffeineContent: Int, caffeine: Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.sugarContent = sugarContent
        sugar = false
        super.init(caffeineContent: caffeineContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
        sugar = isSugarfree(sugarContent: sugarContent)
    }
    
    func isSugarfree(sugarContent : Int) -> Bool {
        return sugarContent < 1
    }
}
