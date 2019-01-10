//
//  File.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(brand, forKey: "brand")
        aCoder.encode(size, forKey: "size")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(openDate, forKey: "openDate")
        aCoder.encode(expiryDate, forKey: "expiryDate")
    }
    
    required init?(coder aDecoder: NSCoder) {
        <#code#>
    }
    
    var description: String {
        return "\(type(of: self))-\(self.brand),\(self.size)ml,\(self.price)원,\(self.name),\(self.openDate.toString())"
    }

    private let brand: String
    private let size: Int
    private let price: Int
    private let name: String
    private let openDate: Date = Date()
    private let expiryDate: Date

    init(brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.expiryDate = self.openDate + Double(expiryDate * 86400)
    }

    func isBuyable(money: Int) -> Bool {
        return self.price <= money
    }

    func beverageInfo<T>(makeInfo: (String, Int) -> T) -> T {
        return makeInfo(self.name, self.price)
    }

    func name(read: (String) -> String) -> String {
        return read(self.name)
    }

    func isExpiryDateOut() -> Bool {
        return self.expiryDate > Date()
    }

    func pay(pay: (Int) -> Int) -> Int {
        return pay(self.price)
    }
    
    static func produce<T>(product: T.Type) -> T where T: Beverage, T: Product {
        return product.init()
    }
}
