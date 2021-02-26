//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Milk: Beverage {
    public enum FarmLocation {
        case domesticFarm
        case overseasFarm
    }
    private let isFrom: FarmLocation
    
    public init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, farmLocation: FarmLocation) {
        isFrom = farmLocation
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate)
    }
    
    convenience override init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, farmLocation: .domesticFarm)
    }
}
