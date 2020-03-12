//
//  Money.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/24.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Money: NSObject, NSCoding {
    private(set) var balance: Int {
        didSet {
            postNotification()
        }
    }
    
    required init?(coder: NSCoder) {
        self.balance = coder.decodeInteger(forKey: "money")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(balance, forKey: "money")
    }
    
    init(_ balance: Int = 0) {
        self.balance = balance
    }
    
    private func postNotification() {
        NotificationCenter.default.post(name: .BalanceDidChange, object: nil,
                                        userInfo: ["balance": balance])
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
