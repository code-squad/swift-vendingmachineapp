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
    
    init(hersheyBuilder: HersheyChocolateDrinks.HersheyBuilder) {
        self.cacaoContentRate = hersheyBuilder.cacaoContentRate
        super.init(builder: hersheyBuilder)
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

extension HersheyChocolateDrinks {
    
    class HersheyBuilder: Beverage.Builder {
        
        let cacaoContentRate: Double
        
        init(brand: String,
             name: String,
             volume: Int,
             price: Int,
             cacaoContentRate: Double) {
            self.cacaoContentRate = cacaoContentRate
            super.init(brand: brand,
                       name: name,
                       volume: volume,
                       price: price)
        }
        
    }
    
}
