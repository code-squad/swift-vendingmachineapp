//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import Foundation

class Beverage: CustomStringConvertible, Equatable {
    
    private var manufacturer: String
    private var volume: Int
    private var price: Int
    private var subbrand: String
    private var manufacturedAt: Date
    private var expiration: Date
    private var skuName: String
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.price = price
        self.subbrand = subbrand
        self.manufacturedAt = manufacturedAt
        self.expiration = expiration
        self.skuName = skuName
    }
    
    var description: String {
        return "\(manufacturer), \(volume), \(price), \(subbrand), \(manufacturedAt), \(expiration), \(skuName)"
    }
    
    public func showPrice() -> Int {
        return self.price
    }
    
<<<<<<< HEAD
    public func isNotExpired() -> Bool {
        return expiration > Date()
=======
    public func showExpiration() -> Date {
        return self.expiration
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
    }
    
    public static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.manufacturer == rhs.manufacturer && lhs.volume == rhs.volume && lhs.price == rhs.price && lhs.subbrand == rhs.subbrand
    }
    
}


