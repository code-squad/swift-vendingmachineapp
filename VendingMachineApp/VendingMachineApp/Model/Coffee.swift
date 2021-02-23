//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Coffee : Beverage {
    private let caffeineContent : Int
    private let hotNCold : String
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, caffeineContent : Int , hotNCold : String) {
        self.caffeineContent = caffeineContent
        self.hotNCold = hotNCold
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured)
    }
    
    func isHot() -> Bool {
        return hotNCold == "hot"
    }
}
