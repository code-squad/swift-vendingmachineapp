//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class BananaMilk : Milk{
    private let sugarContent : Int
    
    init(sugarContent : Int, fatContent: Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.sugarContent = sugarContent
        super.init(fatContent: fatContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    required convenience init(manufactured: Date) {
        self.init(sugarContent: 30, fatContent: 10, brand: "서울우유", volume: 180, price: 2100, name: "바나나는 원래 하얗다", manufactured: manufactured, temperature: 10, kcal: 80)
    }
    
    func isSugarfree(standard : Int) -> Bool {
        return sugarContent < standard
    }
    
}
