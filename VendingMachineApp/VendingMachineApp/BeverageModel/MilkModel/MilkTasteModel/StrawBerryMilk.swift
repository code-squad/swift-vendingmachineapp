//
//  StrawBerryMilk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class StrawBerryMilk: Milk {
    private let actualStrawBerry: Bool
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, farmLocation: FarmLocation, actualStrawBerry: Bool) {
        self.actualStrawBerry = actualStrawBerry
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, farmLocation: farmLocation)
    }
    
    convenience override init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, farmLocation: FarmLocation) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, farmLocation: farmLocation, actualStrawBerry: false)
    }
    
    convenience init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, farmLocation: .domesticFarm, actualStrawBerry: false)
    }
}
