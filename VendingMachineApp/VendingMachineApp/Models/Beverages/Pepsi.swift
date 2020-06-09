//
//  PapsiMini.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

enum Package {
    static let glass = "glass"
    static let can = "can"
    static let pet = "pet"
}

final class Pepsi: Soda {
    private let package: String
    
    init(pepsiBuilder: PepsiBuilder) {
        self.package = pepsiBuilder.package
        super.init(sodaBuilder: pepsiBuilder)
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

extension Pepsi {
    class PepsiBuilder: Soda.SodaBuilder {
        
        let package: String
        
        init(brand: String,
             name: String,
             volume: Int,
             price: Int,
             kiloCalorie: Int,
             package: String) {
            self.package = package
            super.init(brand: brand,
                       name: name,
                       volume: volume,
                       price: price,
                       kiloCalorie: kiloCalorie)
        }
        
    }
}
