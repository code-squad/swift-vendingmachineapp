//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Soda: Beverage, SugarFreeable, Transportable {
    
    private let container: Container
    private let sugar: Int
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         container: Container, sugar: Int) {
        
        self.container = container
        self.sugar = sugar
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured)
    }
    
    func isSugarFree() -> Bool {
        return sugar == 0 ? true : false
    }
    
    func containerType() -> Container {
        return container
    }
    
    func isTransportable() -> Bool {
        switch container {
        case .bottle:
            return true
        case .can:
            return false
        }
    }
}

class coke: Soda {
    
}

class sprite: Soda {
    
}
