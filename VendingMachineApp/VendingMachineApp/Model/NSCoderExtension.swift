//
//  NSCoderExtension.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/03/13.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

enum CustomKeys: String {
    case stock, money, amount, beverages, brand, beverageAmount, price, name, calorie, isHot, manufacturingDate, expirationDate, fatRatio, bananaContent, chocolateContent, strawberryContent, caffeieneContent, flavor, sugarContent
}

extension NSCoder {
    func encode(_ object: Any?, forCustomKey: CustomKeys) {
        self.encode(object, forKey: forCustomKey.rawValue)
    }
    
    func encode(_ value: Int, forCustomKey: CustomKeys) {
        self.encode(value, forKey: forCustomKey.rawValue)
    }
    
    func encode(_ value: Double, forCustomKey: CustomKeys) {
        self.encode(value, forKey: forCustomKey.rawValue)
    }
    
    func encode(_ value: Bool, forCustomKey: CustomKeys) {
        self.encode(value, forKey: forCustomKey.rawValue)
    }
    
    func decodeObject(forCustomKey: CustomKeys) -> Any? {
        return self.decodeObject(forKey: forCustomKey.rawValue)
    }
    
    func decodeInteger(forCustomKey: CustomKeys) -> Int {
        return self.decodeInteger(forKey: forCustomKey.rawValue)
    }
    
    func decodeDouble(forCustomKey: CustomKeys) -> Double {
        return self.decodeDouble(forKey: forCustomKey.rawValue)
    }
    
    func decodeBool(forCustomKey: CustomKeys) -> Bool {
        return self.decodeBool(forKey: forCustomKey.rawValue)
    }
}
