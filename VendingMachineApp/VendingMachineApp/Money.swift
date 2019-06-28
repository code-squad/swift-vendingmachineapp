//
//  Money.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/20/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Money: CustomStringConvertible, Codable {
    private var balance: Int
    
    init() {
        balance = 0
    }
    
    mutating func addBalance (_ money: Int) {
        balance += money
    }
    
    mutating func minusBalance (_ money: Int) throws {
        if balance < money {
            throw BuyError.NotEnoughBalance
        }
        balance -= money
    }
    
    var description: String {
        return String(balance)
    }
    
    func isLargeThan (_ money: Int) -> Bool {
        return money <= balance
    }
}
