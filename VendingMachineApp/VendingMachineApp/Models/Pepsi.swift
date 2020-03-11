//
//  PapsiMini.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Pepsi: Soda {
    
    private let package: Package
    
    init?(volume: Int, price: Int, name: String,
          manufacturingDateInfo: String, kiloCalorie: Int,
          package: Package) {
        self.package = package
        super.init(brand: "팹시", volume: volume,
                   price: price, name: name,
                   manufacturingDateInfo: manufacturingDateInfo,
                   kiloCalorie: kiloCalorie)
    }
    
}

extension Pepsi {
    
    enum Package {
        case glass
        case can
        case pet
    }
    
}
