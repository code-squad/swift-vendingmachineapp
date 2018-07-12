//
//  Beverage.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject, Validate, NSSecureCoding {
    
    private let brand: String
    private let volume: Int
    private let name: String
    private let expirationDate: Date
    var price: Int
    
    var kind: String = "음료"

    init(_ brand: String,_ volume: Int,_ price: Int,_ name: String,_ expirationDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.expirationDate = expirationDate
    }

   override var description: String {
        let dateFormatter = DateUtility.formatDate("yyyyMMdd")
        return "\(kind) - \(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(dateFormatter.string(from: self.expirationDate))"
    }
    
   func isValidate(_ today: Date) -> Bool {
        return today < self.expirationDate
    }
    
    private struct NSCoderKeys {
        static let brand = "brand"
        static let volume = "volume"
        static let price = "price"
        static let name = "name"
        static let expirationDate = "expirationDate"
        static let kind = "kind"
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(brand as NSString, forKey: NSCoderKeys.brand)
        aCoder.encode(NSNumber(value: volume), forKey: NSCoderKeys.volume)
        aCoder.encode(NSNumber(value: price), forKey: NSCoderKeys.price)
        aCoder.encode(name as NSString, forKey: NSCoderKeys.name)
        aCoder.encode(expirationDate as NSDate, forKey: NSCoderKeys.expirationDate)
        aCoder.encode(kind as NSString, forKey: NSCoderKeys.kind)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let brand = aDecoder.decodeObject(of: NSString.self, forKey: NSCoderKeys.brand) else {
            return nil
        }
        guard let volume = aDecoder.decodeObject(of: NSNumber.self, forKey: NSCoderKeys.volume) else {
            return nil
        }
        guard let price = aDecoder.decodeObject(of: NSNumber.self, forKey: NSCoderKeys.price) else {
            return nil
        }
        guard let name = aDecoder.decodeObject(of: NSString.self, forKey: NSCoderKeys.name) else {
            return nil
        }
        guard let expirationDate = aDecoder.decodeObject(of: NSDate.self, forKey: NSCoderKeys.expirationDate) else {
            return nil
        }
        guard let kind = aDecoder.decodeObject(of: NSString.self, forKey: NSCoderKeys.kind) else {
            return nil
        }
        self.brand = brand as String
        self.volume = volume.intValue
        self.price = price.intValue
        self.name = name as String
        self.expirationDate = expirationDate as Date
        self.kind = kind as String

    }
}
