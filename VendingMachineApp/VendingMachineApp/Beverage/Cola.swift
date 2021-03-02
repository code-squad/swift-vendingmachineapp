//
//  Cola.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class Cola: SoftDrink {
    
    private let sugarFree: Bool
    
    init(sugarFree: Bool) {
        self.sugarFree = sugarFree
        super.init(brand: "pepsi", volume: 250, price: 1000, name: "pepsi 콜라", manufacturedAt: Date(), package: .can)
    }
}
