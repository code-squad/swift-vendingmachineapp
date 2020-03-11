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
    
    func isFragile() -> Bool {
        return package == .glass
    }
    
}

extension Pepsi {
    
    override var description: String {
        return super.description + ", package: \(package.description)"
    }
    
}

extension Pepsi {
    
    enum Package: String, CustomStringConvertible {
        case glass
        case can
        case pet
        
        var description: String {
            return rawValue
        }
    }
    
}
