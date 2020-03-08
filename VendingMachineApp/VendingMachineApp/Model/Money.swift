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
    
    func raiseMoney(fiveThousandCount: Int, thousandCount: Int, fiveHundredCount: Int, hundredCount: Int) {
      balance += (fiveThousandCount * 5000) + (thousandCount * 1000) + (fiveHundredCount * 500) + (hundredCount * 100)
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

