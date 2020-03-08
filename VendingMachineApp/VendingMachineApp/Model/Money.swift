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
    
    init(balance: Int = 0) {
        self.balance = balance
    }
    
    func raiseMoney(index: Int) {
        var inputMoney = 0
        switch index {
        case 0:
            inputMoney = index * 5000
        case 1:
           inputMoney = index * 1000
        case 2:
           inputMoney = index * 500
        case 3:
           inputMoney = index * 100
        default:
           inputMoney = 0
        }
      balance += inputMoney
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

