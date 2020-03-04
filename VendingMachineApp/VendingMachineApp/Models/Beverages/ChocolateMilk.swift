//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class ChocolateMilk: Milk {
    private let containsMint: Bool
    
    init(manufacturer: String,
         size: Int,
         price: Int,
         name: String,
         farmCode: MilkFarmCode,
         containsMint: Bool) {
        self.containsMint = containsMint
        super.init(manufacture: manufacturer, size: size, price: price, name: name, farmCode: farmCode)
    }
    
    func isMintChoco() -> Bool {
        return containsMint
    }
}
