//
//  Money.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/12.
//

import Foundation

enum Cash: Int {
    case coin = 100
    case coins = 500
    case bill = 1000
    case bills = 5000
}

struct Money {
    private(set) var cash = 0
    
    mutating func add(_ cash: Cash) -> Int {
        self.cash += cash.rawValue
        return self.cash
    }
    
    mutating func sub(_ money: Int) -> Int {
        self.cash -= money
        return self.cash
    }
}
