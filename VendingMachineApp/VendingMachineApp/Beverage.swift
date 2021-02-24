//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    private let brand: String
    private let name: String
    private let price: Int
    private let size: Int
    private let manufactured: Date
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date) {
        self.brand = brand
        self.name = name
        self.price = price
        self.size = size
        self.manufactured = manufactured
    }

    var description: String {
        return "[\(brand)] \(name): ₩\(price), \(size)ml (\(manufactured.inFormat("yyMMdd")))"
    }
}

enum Container {
    case can
    case bottle
}

protocol Transportable {
    
    func containerType() -> Container
    
    func isTransportable() -> Bool
    
}

protocol Expirable {
    
    func isExpired() -> Bool
    
}

protocol LactoFreeable {
    
    func isLactoFree() -> Bool 
}

protocol SugarFreeable {
    
    func isSugarFree() -> Bool
    
}

protocol Hotable {
    
    func isHotable() -> Bool
    
}
