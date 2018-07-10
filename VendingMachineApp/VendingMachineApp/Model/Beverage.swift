//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Beverage: NSObject, NSCoding {
    
    private let name: String
    private let price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    override convenience init() {
        self.init(name: DefaultData.beverage.name, price: DefaultData.beverage.price)
    }
    
    override var description: String {
        return "\(self.name)"
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let beverage = object as? Beverage {
            return beverage.name == self.name && beverage.price == self.price
        } else {
            return false
        }
    }
    
    var beveragePrice: Int {
        return self.price
    }
    
    // MARK: NSSecureCoding
    private struct NSCoderKeys {
        static let nameKey = "name"
        static let priceKey = "price"
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name as NSString, forKey: NSCoderKeys.nameKey)
        aCoder.encode(NSNumber(value: price), forKey: NSCoderKeys.priceKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(of: NSString.self, forKey: NSCoderKeys.nameKey) else {
            return nil
        }
        guard let price = aDecoder.decodeObject(of: NSNumber.self, forKey: NSCoderKeys.priceKey) else {
            return nil
        }
        self.name = name as String
        self.price = price.intValue
    }
}
