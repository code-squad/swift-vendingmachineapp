//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class StrawberryMilk: Milk {
    private(set) var strawberryContentRate: Int
    
    init(manufacturer: String,
         size: Int,
         price: Int,
         name: String,
         farmCode: MilkFarmCode,
         strawberryContentRate: Int) {
        self.strawberryContentRate = strawberryContentRate
        super.init(manufacture: manufacturer, size: size, price: price, name: name, farmCode: farmCode)
    }
}
