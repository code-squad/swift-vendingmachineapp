//
//  Money.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Money {

    private var balance = 0

    init() {}

    init(_ balance: Int) {
        self.balance = balance
    }

    func add(_ money: Int) {
        self.balance += money
    }

    func subtract(_ money: Int) {
        self.balance -= money
    }

    func currentBalance() -> Int {
        return self.balance
    }

    func isAffordable(item: Beverage) -> Bool {
        return item.isCheaper(than: self.balance)
    }

    func hasMiminumBalance(than price: Int) -> Bool {
        return self.balance >= price
    }
}
