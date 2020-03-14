//
//  PapsiMini.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Pepsi: Soda {
    
    private let package: String
    
    init?(volume: Int,
          price: Int,
          name: String,
          manufacturingDateInfo: String,
          kiloCalorie: Int,
          package: String) {
        self.package = package
        super.init(brand: "팹시",
                   volume: volume,
                   price: price,
                   name: name,
                   manufacturingDateInfo: manufacturingDateInfo,
                   kiloCalorie: kiloCalorie)
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

enum Package {
    
    static let glass = "glass"
    static let can = "can"
    static let pet = "pet"
    
}

