//
//  Coke.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class Coke: Soda {
    
    enum Package {
        case can
        case pet
        case glass
    }
    
    private var package: Package
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, sugarContent: Int, package: Package) {
        self.package = package
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, sugarContent: sugarContent)
    }
}
