//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Coffee: Beverage, Hotable, Transportable, Expirable {
    
    private let isHot: Bool
    private let container: Container
    private let expiry: Date
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         isHot: Bool, container: Container, expireAfter: Int) {
        
        self.isHot = isHot
        self.container = container
        self.expiry = manufactured.add(amount: expireAfter)
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured)
    }
    
    func isHotable() -> Bool {
        return isHot
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
    
    func isExpired() -> Bool {
        let today = Date()
        let isExpired = expiry < today
        return isExpired
    }
}

class Cantata: Coffee {
    
}

class Georgia: Coffee {
    
}
