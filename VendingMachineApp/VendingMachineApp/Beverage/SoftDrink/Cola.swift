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
        super.init(brand: "코카콜라", volume: 250, price: 1000, name: "코카콜라", manufacturedAt: Date().addingTimeInterval(800000), temparature: 2, calories: 90, isLowfat: false, package: .can)
    }
}
