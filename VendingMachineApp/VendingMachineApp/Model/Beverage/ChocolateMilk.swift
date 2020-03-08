//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    enum Package: String {
        case plastic = "plastic"
        case paper = "paper"
        case vinyl = "vinyl"
    }
    
    private var package: Package
    
    init(brand: String, capacity: Double, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Double, beverageIndex: VendingMachine.BeverageNumbers, farmCode: FarmCode, package: Package) {
        self.package = package
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, beverageIndex: beverageIndex, farmCode: farmCode)
    }
    
    func isSamePackage(as package: Package) -> Bool {
        return self.package == package
    }
}
