//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private var juiceContent: Double
    
    init(brand: String, capacity: Capacity, price: Price, name: String, manufacturingDate: Date, calorie: Calorie, farmCode: FarmCode, temperature: Temperature, beverageIndex: VendingMachine.BeverageNumbers, juiceContent: Double) {
        self.juiceContent = juiceContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, beverageIndex: beverageIndex, farmCode: farmCode)
    }
    
    func isHigher(than juiceContent: Double) -> Bool {
        return self.juiceContent > juiceContent
    }
}
