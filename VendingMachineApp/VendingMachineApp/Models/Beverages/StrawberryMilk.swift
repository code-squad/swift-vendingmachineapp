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
    
    init(manufacturer: String = "매일유업",
         size: Int = 300,
         price: Int = 1500,
         name: String = "상하목장 유기농 딸기우유",
         farmCode: MilkFarmCode = .seoulCowFarm,
         strawberryContentRate: Int = 0) {
        self.strawberryContentRate = strawberryContentRate
        super.init(manufacture: manufacturer, size: size, price: price, name: name, farmCode: farmCode)
    }
    
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        hasher.combine(strawberryContentRate)
    }
    
    override func isEqual(to rhs: Beverage) -> Bool {
        return rhs is StrawberryMilk
            && hashValue == rhs.hashValue
    }
}
