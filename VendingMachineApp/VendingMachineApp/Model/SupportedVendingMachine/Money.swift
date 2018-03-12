//
//  Money.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Money: Codable {
    private var change: Int
    
    init(_ change: Int) {
        self.change = change
    }
    
    func plus(coin: Money) throws -> Money {
        if isNegative(coin: coin) { throw VendingMachineErrors.incorrectMoney }
        return Money(change + coin.change)
    }
    
    func subtract(coin: Money) throws -> Money {
        guard isAvaiable(coin: coin) else { throw VendingMachineErrors.notEnoughMoney }
        return Money(self.change - coin.change)
    }
    
    func countChange() -> Int {
        return self.change
    }
    
    func isAvaiable(coin: Money) -> Bool {
        return self.change - coin.change >= 0
    }
    
    func isNegative(coin: Money) -> Bool {
        return coin.change < 0
    }
}

extension Money: Equatable, Comparable {
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.countChange() < rhs.countChange()
    }
    
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.countChange() == rhs.countChange()
    }
}
