//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class ChocolateMilk: Milk {
    private(set) var cacaoContentRate: Int
    
    init(manufacturer: String = "매일유업",
         size: Int = 300,
         price: Int = 1500,
         name: String = "매일 멸균우유 초코",
         farmCode: MilkFarmCode = .gyeonggiBullFarm,
         cacaoContentRate: Int = 10) {
        self.cacaoContentRate = cacaoContentRate
        super.init(manufacture: manufacturer, size: size, price: price, name: name, farmCode: farmCode)
    }
    
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        hasher.combine(cacaoContentRate)
    }
}
