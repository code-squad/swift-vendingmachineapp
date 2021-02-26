//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Milk: Beverage {
    private let farm: LocationTrackable
    
    public init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, farm: LocationTrackable) {
        self.farm = farm
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate)
    }
}
