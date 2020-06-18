//
//  PapsiMini.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class Pepsi: Soda {
    enum Package: String, CustomStringConvertible {
        case glass
        case can
        case pet
        
        var description: String {
            return self.rawValue
        }
    }
    private let package: Package
    
    init(
        package: Package,
        kiloCalorie: Int,
        brand: String,
        name: String,
        volume: Int,
        price: Int
    ) {
        self.package = package
        super.init(
            kiloCalorie: kiloCalorie,
            brand: brand,
            name: name,
            volume: volume,
            price: price
        )
    }
    
    func isFragile() -> Bool {
        return package == Package.glass
    }
}

extension Pepsi {
    override var description: String {
        return super.description + ", package: \(package.description)"
    }
}
