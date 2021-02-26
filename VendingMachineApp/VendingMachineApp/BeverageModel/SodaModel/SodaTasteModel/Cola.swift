//
//  CocaCola.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Cola: Soda {
    public enum BottleType {
        case 알루미늄
        case 유리
        case 플라스틱
    }
    private let bottle: BottleType
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, zeroCalories: Bool, bottle: BottleType) {
        self.bottle = bottle
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, zeroCalories: zeroCalories)
    }
    
    convenience override init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, zeroCalories: Bool) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, zeroCalories: zeroCalories, bottle: .알루미늄)
    }
    
    convenience init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, zeroCalories: false, bottle: .알루미늄)
    }
}
