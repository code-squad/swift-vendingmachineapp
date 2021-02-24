//
//  File.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class StrawberryMilk : Milk , Beveragable {
    private let expiryDate : Date
    private let hot : Bool
    private let calory : Int
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, mlikFarmCode: Int, expiryDate: Date,hot : Bool, calory : Int) {
        self.expiryDate = expiryDate
        self.hot = hot
        self.calory = calory
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, mlikFarmCode: mlikFarmCode)
    }
    
    func validate(with date:Date) -> Bool {
        return expiryDate < date
    }
    
    func isHot() -> Bool {
        return hot == true
    }
    
    func isLowCalorie() -> Bool {
        return calory > 10
    }
}
