//
//  File.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(brand, forKey: BeverageArchiveKey.brand)
        aCoder.encode(size, forKey: BeverageArchiveKey.size)
        aCoder.encode(price, forKey: BeverageArchiveKey.price)
        aCoder.encode(name, forKey: BeverageArchiveKey.name)
        aCoder.encode(expiryDate, forKey: BeverageArchiveKey.expiryDate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        brand = aDecoder.decodeObject(forKey: BeverageArchiveKey.brand) as! String
        size = aDecoder.decodeInteger(forKey: BeverageArchiveKey.size)
        price = aDecoder.decodeInteger(forKey: BeverageArchiveKey.price)
        name = aDecoder.decodeObject(forKey: BeverageArchiveKey.name) as! String
        expiryDate = aDecoder.decodeObject(forKey: BeverageArchiveKey.expiryDate) as! Date
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

    func pay(balance: Int, pay: (Int, Int) -> Int) -> Int {
        return pay(balance, price)
    }
    
    static func produce<T>(product: T.Type) -> T where T: Beverage, T: Product {
        return product.init()
    }
}
