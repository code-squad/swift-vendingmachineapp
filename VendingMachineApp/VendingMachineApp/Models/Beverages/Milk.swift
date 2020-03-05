//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/03.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    enum MilkFarmCode: String {
        case seoulCowFarm = "COW001"
        case gyeonggiBullFarm = "BUL002"
        case incheonRhinoFarm = "RNO003"
    }
    
    private(set) var farmCode: MilkFarmCode
    private var expirationDate: Date
    
    init(manufacture: String, size: Int, price: Int, name: String, farmCode: MilkFarmCode) {
        self.farmCode = farmCode
        self.expirationDate = Date()
        super.init(manufacturer: manufacture, size: size, price: price, name: name)
        
        let week = DateComponents(day: 7)
        self.expirationDate = Calendar.current.date(byAdding: week, to: self.productionDate)!
    }
    
    func isValid(with date: Date) -> Bool {
        return date < expirationDate
    }
}
