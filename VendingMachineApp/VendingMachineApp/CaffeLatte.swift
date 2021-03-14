//
//  CaffeLatte.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class CaffeeLatte : Coffee{
    private let sugarContent : Int
    
    init(sugarContent : Int, caffeineContent: Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.sugarContent = sugarContent
        super.init(caffeineContent: caffeineContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    required convenience init(manufactured: Date) {
        self.init(sugarContent: 30, caffeineContent: 30, brand: "스타벅스", volume: 236, price: 3500, name: "카페라떼", manufactured: manufactured, temperature: 90, kcal: 330)
    }
    
    func isSugarfree(standard : Int) -> Bool {
        return self.sugarContent < standard
    }
}
