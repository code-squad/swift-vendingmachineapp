//
//  Cashier.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/11.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class Money {
    enum Notification {
        static let balanceDidChange = Foundation.Notification.Name("balanceDidChange")
    }
    
    init(balance: Int = Quantity.zero) {
        self.balance = balance
    }
    
    private var balance: Int {
        didSet {
            NotificationCenter.default.post(name: Notification.balanceDidChange, object: self)
        }
    }
    
    func subtract(price: Money) {
        balance -= price.balance
    }
    
    func plus(money: Money) {
        balance += money.balance
    }
}

extension Money: Comparable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.balance == rhs.balance
    }
    
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.balance < rhs.balance
    }
}

extension Money: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(balance)
    }
}

extension Money: CustomStringConvertible {
    var description: String {
        return String(balance)
    }
}
