//
//  Money.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/26.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

final class Money {
    private var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    convenience init() {
        self.init(amount: 0)
    }
}

extension Money: AdditiveArithmetic, Comparable {
    static var zero: Money {
        Money()
    }

    static func == (lhs: Money, rhs: Money) -> Bool {
        lhs.amount == rhs.amount
    }
    
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount < rhs.amount
    }
    
    static func + (lhs: Money, rhs: Money) -> Money {
        return Money(amount: lhs.amount + rhs.amount)
    }
    
    static func += (lhs: inout Money, rhs: Money) {
        lhs.amount = lhs.amount + rhs.amount
    }
    
    static func - (lhs: Money, rhs: Money) -> Money {
        return Money(amount: lhs.amount - rhs.amount)
    }

    static func -= (lhs: inout Money, rhs: Money) {
        lhs.amount = lhs.amount - rhs.amount
    }
}
