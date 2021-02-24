//
//  File.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class StrawberryMilk : Milk {
    private let expiryDate : Date
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, mlikFarmCode: Int, expiryDate: Date) {
        self.expiryDate = expiryDate
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, mlikFarmCode: mlikFarmCode)
    }
    
    func validate(with date:Date) -> Bool {
        return expiryDate < date
    }
}
