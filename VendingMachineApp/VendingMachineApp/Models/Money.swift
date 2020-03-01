//
//  Money.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/24.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Money {
    private(set) var balance: Int {
        didSet {
            balanceChanged()
        }
    }
    
    init(_ balance: Int = 0) {
        self.balance = balance
    }
    
    private func balanceChanged() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BalanceChange"), object: nil, userInfo: ["balance": balance])
    }
    
    func add(money: Money) {
        self.balance += money.balance
    }
    
    func subtract(money: Money) {
        self.balance -= money.balance
    }
}

extension Money: Comparable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.balance == rhs.balance
    }
    
    static func > (lhs: Money, rhs: Money) -> Bool {
        return lhs.balance > rhs.balance
    }
    
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.balance < rhs.balance
    }
}
