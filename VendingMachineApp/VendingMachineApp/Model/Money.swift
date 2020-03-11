//
//  Money.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/26.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

final class Money: NSObject, NSCoding {
    private var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    convenience override init() {
        self.init(amount: 0)
    }
    
    // MARK: - CustomStringConvertible
    
    override var description: String {
        "\(amount)"
    }
    
    // MARK: - NSCoding
    
    init?(coder: NSCoder) {
        self.amount = coder.decodeInteger(forKey: "amount")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(amount, forKey: "amount")
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
