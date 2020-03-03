//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class BananaMilk: Milk {
    let sugarContentRate: Int
    
    init(manufacturer: String,
         size: Int,
         price: Int,
         name: String,
         farmCode: MilkFarmCode,
         sugarContentRate: Int) {
        self.sugarContentRate = sugarContentRate
        super.init(manufacture: manufacturer, size: size, price: price, name: name, farmCode: farmCode)
    }
}
