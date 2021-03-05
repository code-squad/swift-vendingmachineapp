//
//  TOP.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class TOP: Coffee {
    
    private let adModel: String
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, adModel: String) {
        self.adModel = adModel
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, caffeine: caffeine)
    }
    
    convenience init() {
        self.init(brand: "맥심", volume: 275, price: 900, name: "TOP", createdAt: date, expiredAt: date, caffeine: 6, adModel: "원빈")
    }
    
    func isModelChanged(current: String) -> Bool {
        return current != adModel
    }
}
