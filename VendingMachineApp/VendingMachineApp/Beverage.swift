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
    
    func isPurchashable(with money: Int) -> Bool {
        return money >= price
    }
    
    func bought(_ moneyUpdator: (Int) -> ()) {
        return moneyUpdator(-price)
    }

    var description: String {
        return "[\(brand)] \(name): ₩\(price), \(size)ml (\(manufactured.inFormat("yyMMdd")))"
    }
}

extension Beverage: Hashable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(name)
    }
}
