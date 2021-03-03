//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Coffee: Beverage {
    public enum Bean {
        case arabica
        case robusta
    }
    private let bean: Bean
    
    init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date, bean: Bean) {
        self.bean = bean
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime)
    }
    
    convenience override init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, bean: .robusta)
    }
}
