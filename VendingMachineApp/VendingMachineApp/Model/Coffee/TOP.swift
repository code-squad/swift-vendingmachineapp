//
//  TOP.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class TOP: Coffee {
    
    private let hot: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, hot: Bool) {
        self.hot = hot
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, caffeine: caffeine)
    }
  
    required init() {
        hot = false
        super.init(brand: "맥심", volume: 275, price: 900, name: "TOP", createdAt: date, expiredAt: date, caffeine: 94)
    }
    
    func isHot() -> Bool {
        return hot
    }
}
