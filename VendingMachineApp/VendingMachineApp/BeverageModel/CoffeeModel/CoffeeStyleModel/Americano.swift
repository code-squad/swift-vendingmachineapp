//
//  Americano.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Americano: Coffee {
    private let caffeine: Int
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, bean: Bean, caffeine: Int) {
        self.caffeine = caffeine
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, bean: bean)
    }
    
    convenience init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, caffeine: Int){
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, bean: .로부스타원두, caffeine: caffeine)
    }
}
