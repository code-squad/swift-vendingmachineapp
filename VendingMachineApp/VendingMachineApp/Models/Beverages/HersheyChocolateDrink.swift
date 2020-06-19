//
//  Chocoemon.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class HersheyChocolateDrink: Milk {
    private let cacaoContentRate: Double
    
    init(
        cacaoContentRate: Double,
        brand: String,
        name: String,
        volume: Int,
        price: Int
    ) {
        self.cacaoContentRate = cacaoContentRate
        super.init(brand: brand,
                   name: name,
                   volume: volume,
                   price: price)
    }
    
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        hasher.combine(cacaoContentRate)
    }
    
    func isHighCacao() -> Bool {
        return cacaoContentRate >= Quantity.minHighCacaoRate
    }
}

extension HersheyChocolateDrink {
    override var description: String {
        return super.description + ", 카카오: \(cacaoContentRate)%"
    }
}
