//
//  TopAmericano.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class TopAmericano : Coffee {
    private let hot : Bool
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, caffeineContent: Int, hot: Bool) {
        self.hot = hot
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, caffeineContent: caffeineContent)
    }
    
    func isHot() -> Bool {
        return hot == true
    }
}
