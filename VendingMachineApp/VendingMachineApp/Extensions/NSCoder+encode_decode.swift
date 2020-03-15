//
//  NSCoder+encode_decode.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/03/15.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

extension NSCoder {
    enum keys: String {
        case stock = "stock"
        case purchased = "purchased"
        case balance = "balance"
        
        case name = "name"
        case brand = "brand"
        case servingSize = "servingSize"
        case price = "price"
        case manufactureDate = "manufactureDate"
        case expirationDate = "expirationDate"
        case beverages = "beverages"
        case farmCode = "farmCode"
        case cacaoContentRate = "cacaoContentRate"
        case bananaContentGram = "bananaContentGram"
        case isSugarFree = "isSugarFree"
        case packageColor = "packageColor"
        case packageMaterial = "packageMaterial"
        case isCoffeeLatte = "isCoffeeLatte"
        case servingCaffeine = "servingCaffeine"
        case isHotCoffee = "isHotCoffee"
        
        case money = "money"
        case stockBeverages = "stockBeverages"
    }
    
    func decodeBool(forKey: keys) -> Bool {
        return decodeBool(forKey: forKey.rawValue)
    }
    
    func decodeInteger(forKey: keys) -> Int {
        return decodeInteger(forKey: forKey.rawValue)
    }
    
    func decodeDouble(forKey: keys) -> Double {
        return decodeDouble(forKey: forKey.rawValue)
    }
    
    func decodeObject(forKey: keys) -> Any? {
        return decodeObject(forKey: forKey.rawValue)
    }
    
    func encode(value: Bool, forKey: keys) {
        encode(value, forKey: forKey.rawValue)
    }
    
    func encode(value: Int, forKey: keys) {
        encode(value, forKey: forKey.rawValue)
    }
    
    func encode(value: Double, forKey: keys) {
        encode(value, forKey: forKey.rawValue)
    }
    
    func encode(object: Any?, forKey: keys) {
        encode(object, forKey: forKey.rawValue)
    }
}
