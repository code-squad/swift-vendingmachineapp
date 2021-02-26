//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class BananaMilk: Milk {
    private let usageOfColoring: Bool
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, farmLocation: FarmLocation, usageOfColoring: Bool) {
        self.usageOfColoring = usageOfColoring
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, farmLocation: farmLocation)
    }
    
    convenience override init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, farmLocation: FarmLocation) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, farmLocation: farmLocation, usageOfColoring: true)
    }
    
    convenience init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, farmLocation: .domesticFarm, usageOfColoring: true)
    }
}
