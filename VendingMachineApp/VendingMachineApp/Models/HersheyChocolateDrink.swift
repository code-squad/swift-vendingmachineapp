//
//  Chocoemon.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class HersheyChocolateDrink: Milk {
    
    private let cacaoContentRate: Double
    
    init?(volume: Int, price: Int, name: String,
          manufacturingDateInfo: String,
          expirationDateInfo: String,
          cacaoContentRate: Double) {
        guard cacaoContentRate >= Quantity.minRate,
            cacaoContentRate <= Quantity.maxRate
            else {
                return nil
        }
        
        self.cacaoContentRate = cacaoContentRate
        super.init(brand: "허쉬초콜릿드링크",
                   volume: volume, price: price,
                   name: name,
                   manufacturingDateInfo: manufacturingDateInfo,
                   expirationDateInfo: expirationDateInfo)
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
