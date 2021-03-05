//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage: Shopable, CustomStringConvertible {
    
    private let brand: String
    private let name: String
    private let price: Int
    private let size: Int
    private let manufactured: Date
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String) {
        self.brand = brand
        self.name = name
        self.price = price
        self.size = size
        self.manufactured = dateFactory.create(from: manufacturedInString)
    }
    
    func isPurchashable(with money: Int) -> Bool {
        return money >= price
    }
    
    func subtractPrice(from balance: Int) -> Int {
        return balance - price
    }

    var description: String {
        return "[\(brand)] \(name): ₩\(price), \(size)ml (\(manufactured.inFormat("yyMMdd")))"
    }
}
