//
//  Cider.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/01.
//

import Foundation

class Cider: SoftDrink {
    
    private let sugars: Double //당도
    
    init(sugars: Double) {
        self.sugars = sugars
        super.init(brand: "코카콜라", volume: 500, price: 1200, name: "스프라이트", manufacturedAt: Date(), temparature: 3, calories: 90, isLowfat: false, package: .plastic)
    }
}
