//
//  File.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class StrawberryMilk : Milk {
    private let strawberryContent : Int
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, mlikFarmCode : Int ,expiryDate : Date, hot : Bool, calory : Int, strawberryContent : Int) {
        self.strawberryContent = strawberryContent
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, mlikFarmCode: mlikFarmCode, expiryDate: expiryDate, hot: hot, calory: calory)
    }
    
    
}
