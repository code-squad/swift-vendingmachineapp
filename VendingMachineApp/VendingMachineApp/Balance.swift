//
//  Balance.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 11..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

class Balance {
    private var balance: Int = 0
    
    func insert(money: Money) {
        self.balance += money.rawValue
    }
    
    func pay(beverage: Beverage) {
        let pay: (Int, Int) -> Int = { (price: Int, balance: Int) -> Int in
                return balance - price
        }
        balance = beverage.pay(balance: balance, pay: pay)
    }
}
