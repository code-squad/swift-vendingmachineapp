//
//  Money.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Money: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: "balance")
    }

    required init?(coder aDecoder: NSCoder) {
        balance = aDecoder.decodeInteger(forKey: "balance")
    }


    private var balance = 0

    override init() {}

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
