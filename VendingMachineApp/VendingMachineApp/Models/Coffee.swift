//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    
    let isHot: Bool
    
    init?(brand: String, volume: Int, price: Int,
          name: String, manufacturingDateInfo: String, isHot: Bool) {
        self.isHot = isHot
        super.init(brand: brand, volume: volume, price: price,
        name: name, manufacturingDateInfo: manufacturingDateInfo)
    }
    
}

extension Coffee {
    override var description: String {
        return super.description + ", \(isHot)"
    }
}
