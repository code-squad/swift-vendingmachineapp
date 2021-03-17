//
//  Money.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class Money: NSObject, NSCoding, Comparable {
    
    enum Amount: Int, CaseIterable {
        case thousand = 1000
        case fivethousand = 5000
    }
    
    private(set) var money: Int
    
    init(with money: Int) {
        self.money = money
    }
        
    required init?(coder: NSCoder) {
        self.money = coder.decodeInteger(forKey: "money")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(money, forKey: "money")
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
    
    static func += (lhs: Money, rhs: Money) {
        lhs.money = lhs.money + rhs.money
    }
    
    static func -= (lhs: Money, rhs: Money) {
        lhs.money = lhs.money - rhs.money
    }
    
    
    override var description: String {
        return "\(self.money)"
    }
}
