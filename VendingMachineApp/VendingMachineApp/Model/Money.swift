//
//  Money.swift
//  VendingMachineApp
//
//  Created by delma on 2020/03/07.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Money {
    private(set) var balance: Int
//    private(set) var moneyUnit = [5000, 1000, 500, 100]
    
    enum MoneyUnit: Int {
        case fiveThousand = 5000
        case thousand = 1000
        case fiveHundred = 500
        case hundred = 100
    }
    
    init(balance: Int = 0) {
        self.balance = balance
    }
    
    func raiseMoney(moneyUnit: MoneyUnit) {
        balance += moneyUnit.rawValue
    }
    
    func confirmBalance(_ money: Money) {
        balance = money.balance + self.balance
    }
    
    func subtract(_ price: Money) {
        balance = self.balance - price.balance
    }
    
    
}

extension Money: Equatable, Hashable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.balance == rhs.balance
    }
    
    static func - (lhs: Money, rhs: Money) -> Int {
        return lhs.balance - rhs.balance
    }

    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.balance < rhs.balance
    }
    
    static func + (lhs: Money, rhs: Money) -> Int {
        return lhs.balance + rhs.balance
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(balance)
    }
}

