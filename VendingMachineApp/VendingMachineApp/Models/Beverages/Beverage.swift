//
//  Beverage .swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Codable {
    private let brand: String
    private let volume: Int
    private let productName: String
    private let expiryDate: Date
    private let calorie: Int
    private(set) var price: Money
    
    private enum CodingKeys: CodingKey {
        case brand, volume, productName, expiryDate, calorie, price
    }
    
    init(brand: String, volume: Int, price: Money, productName: String, expiryDate: Date, calorie: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.expiryDate = expiryDate
        self.calorie = calorie
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        brand = try values.decode(String.self, forKey: .brand)
        volume = try values.decode(Int.self, forKey: .volume)
        productName = try values.decode(String.self, forKey: .productName)
        expiryDate = try values.decode(Date.self, forKey: .expiryDate)
        calorie = try values.decode(Int.self, forKey: .calorie)
        price = try values.decode(Money.self, forKey: .price)
    }
    
    func isExpired(with date: Date) -> Bool {
        return date <= self.expiryDate
    }
    
    func isLowCalorie() -> Bool {
        return self.calorie <= 200
    }
    
    var description: String {
        let dateFormatter = DateUtility.formatDate(format: "yyyyMMdd")
        return """
        \(self.brand), \(self.volume)ml, \(self.price)원, \(self.productName)
        ,\(dateFormatter.string(from: self.expiryDate)), \(self.calorie)
        """
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(brand, forKey: .brand)
        try container.encode(volume, forKey: .volume)
        try container.encode(price, forKey: .price)
        try container.encode(productName, forKey: .productName)
        try container.encode(expiryDate, forKey: .expiryDate)
        try container.encode(calorie, forKey: .calorie)
        try container.encode(price, forKey: .price)
    }
}
