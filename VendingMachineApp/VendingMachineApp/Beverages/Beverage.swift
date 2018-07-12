//
//  Beverage.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Validate, Codable {
    
    private let brand: String
    private let volume: Int
    private let name: String
    private let expirationDate: Date
    var price: Int
    
    var kind: String = "음료"

    private enum CodingKeys: CodingKey {
        case brand, volume, price, name, expirationDate, kind
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(brand, forKey: .brand)
        try container.encode(volume, forKey: .volume)
        try container.encode(price, forKey: .price)
        try container.encode(name, forKey: .name)
        try container.encode(expirationDate, forKey: .expirationDate)
        try container.encode(kind, forKey: .kind)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.brand = try values.decode(String.self, forKey: .brand)
        self.volume = try values.decode(Int.self, forKey: .volume)
        self.price = try values.decode(Int.self, forKey: .price)
        self.name = try values.decode(String.self, forKey: .name)
        self.expirationDate = try values.decode(Date.self, forKey: .expirationDate)
        self.kind = try values.decode(String.self, forKey: .kind)
    }

    init(_ brand: String,_ volume: Int,_ price: Int,_ name: String,_ expirationDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.expirationDate = expirationDate
    }

    var description: String {
        let dateFormatter = DateUtility.formatDate("yyyyMMdd")
        return "\(kind) - \(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(dateFormatter.string(from: self.expirationDate))"
    }
    
   func isValidate(_ today: Date) -> Bool {
        return today < self.expirationDate
    }

}
