//
//  File.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class Beverage: NSObject, NSCoding {
    
    //MARK: - Keys
    
    private let brandKey: String = "brand"
    private let sizeKey: String = "size"
    private let priceKey: String = "price"
    private let nameKey: String = "name"
    private let expiryDateKey: String = "expiryDate"
    
    //MARK: Encode, Decode
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(brand, forKey: self.brandKey)
        aCoder.encode(size, forKey: self.sizeKey)
        aCoder.encode(price, forKey: self.priceKey)
        aCoder.encode(name, forKey: self.nameKey)
        aCoder.encode(expiryDate, forKey: self.expiryDateKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        brand = aDecoder.decodeObject(forKey: self.brandKey) as! String
        size = aDecoder.decodeInteger(forKey: self.sizeKey)
        price = aDecoder.decodeObject(forKey: self.priceKey) as! Money
        name = aDecoder.decodeObject(forKey: self.nameKey) as! String
        expiryDate = aDecoder.decodeObject(forKey: self.expiryDateKey) as! Date
    }
    
    //MARK: - Properties
    //MARK: Private

    private let brand: String
    private let size: Int
    private let price: Money
    private let name: String
    private let openDate: Date = Date()
    private let expiryDate: Date

    //MARK: Initialize
    
    init(brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.brand = brand
        self.size = size
        self.price = Money(money: price)
        self.name = name
        self.expiryDate = self.openDate + Double(expiryDate * 86400)
    }

    //MARK: - Methods
    
    func pay(balance: Money) {
        balance.pay(price: self.price)
    }
    
    func isBuyable(balance: Money) -> Bool {
        return balance > self.price
    }
    
    func increaseEqualName(_ purchaseInfo: inout [String: CGFloat]) {
        
        if purchaseInfo["\(name)"] == nil {
            purchaseInfo["\(name)"] = 0
        }
        purchaseInfo["\(name)"]? += 1
    }
    
    //MARK: Static
    
    static func produce(product: BeverageProduct.Type) -> Beverage {
        return product.init() as Beverage
    }
}
