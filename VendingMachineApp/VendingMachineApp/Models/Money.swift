//
//  Money.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/03.
//

import Foundation

class Money: NSObject, NSCoding {
    private var property: Int
    
    init(how property: Int) {
        self.property = property
    }
    
    convenience override init() {
        self.init(how: 0)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(property, forKey: "property")
    }
    
    required init?(coder: NSCoder) {
        self.property = coder.decodeInteger(forKey: "property")
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
    
    override var description: String {
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

