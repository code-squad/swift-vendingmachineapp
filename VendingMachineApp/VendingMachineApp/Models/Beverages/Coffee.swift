//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    
    private let celsius: Int
    
    init?(builder: Beverage.Builder,
          manufacturingDateInfo: String,
          celsius: Int) {
        self.celsius = celsius
        super.init(builder: builder,
                   manufacturingDateInfo: manufacturingDateInfo)
    }
    
    func isHot() -> Bool {
        return celsius >= Quantity.minHotCelsius
    }
    
}

extension Coffee {
    
    override var description: String {
        return super.description + ", \(celsius)°C"
    }
    
}
