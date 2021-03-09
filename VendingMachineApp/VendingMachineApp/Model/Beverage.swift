//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage: Shopable, NSCoding {
    
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
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "brand") as! String
        self.name = coder.decodeObject(forKey: "name") as! String
        self.price = coder.decodeInteger(forKey: "price")
        self.size = coder.decodeInteger(forKey: "size")
        self.manufactured = coder.decodeObject(forKey: "manufactured") as! Date
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(name, forKey: "name")
        coder.encode(price, forKey: "price")
        coder.encode(size, forKey: "size")
        coder.encode(manufactured, forKey: "manufactured")
    }
    
    func isPurchashable(with money: Int) -> Bool {
        return money >= price
    }
    
    func subtractPrice(from balance: Int) -> Int {
        return balance - price
    }
}

//extension Beverage: CustomStringConvertible {
//
//    var description: String {
//        return "[\(brand)] \(name): ₩\(price), \(size)ml (\(manufactured.inFormat("yyMMdd")))"
//    }
//
//}
