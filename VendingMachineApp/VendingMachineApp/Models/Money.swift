//
//  Money.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/03.
//

import Foundation

class Money: CustomStringConvertible {
    private var property: Int
    
    init(how property: Int) {
        self.property = property
    }
    
    convenience init() {
        self.init(how: 0)
    }
    
    func deposit(unit: Int) {
        property += unit
    }
    
    func withdrawl(unit: Int) {
        property -= unit
    }
    
    func count() -> Int {
        return property
    }
    
    var description: String {
        return "\(property)"
    }
}

extension Money: Comparable {
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.property < rhs.property
    }
    
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.property == rhs.property
    }
    
   static func + (lhs: Money, rhs: Money) -> Money {
        let newProperty:Int = lhs.property + rhs.property
        return Money(how: newProperty)
    }
    
    static func - (lhs: Money, rhs: Money) -> Money {
        let newProperty:Int = lhs.property - rhs.property
        return Money(how: newProperty)
    }
    
    static func += (lhs: inout Money, rhs: Money) {
        lhs.property = lhs.property + rhs.property
    }
    
    static func -= (lhs: inout Money, rhs: Money) {
        lhs.property = lhs.property - rhs.property
    }
}

