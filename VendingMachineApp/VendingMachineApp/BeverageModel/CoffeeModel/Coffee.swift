//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Coffee: Beverage {
    public enum Bean {
        case 아라비카원두
        case 로부스타원두
    }
    private let bean: Bean
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, bean: Bean) {
        self.bean = bean
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate)
    }
    
    convenience override init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, bean: .로부스타원두)
    }
}
