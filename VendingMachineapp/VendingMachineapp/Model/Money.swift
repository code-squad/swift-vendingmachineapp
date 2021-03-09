//
//  Money.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class Money: Comparable, Equatable {
    
    private(set) var money: Int
    
    init(with money: Int) {
        self.money = money
    }
    
    func changeMoney(with money: Money) {
        self.money = self + money
    }
    
    func compare(with price: Int) -> Bool {
        return self.money >= price
    }
    
    func checkChange() -> Money{
        return self
    }
    
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.money < rhs.money
    }
    
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.money == rhs.money
    }
    
    static func + (lhs: Money, rhs: Money) -> Int {
        return lhs.money + rhs.money
    }
}
