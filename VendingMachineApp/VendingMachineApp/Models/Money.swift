//
//  Cashier.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/11.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol Moneyable {
    mutating func subtract(price: Money)
    mutating func plus(money: Money)
    func isMoreThan(money: Money) -> Bool
    func currentMoney() -> Int 
}

struct Money: Moneyable {
    enum Notification {
        static let balanceDidChange = Foundation.Notification.Name("balanceDidChange")
    }
    
    init(balance: Int = Quantity.zero) {
        self.balance = balance
    }
    
    private var balance: Int {
        didSet {
            NotificationCenter.default.post(
                name: Notification.balanceDidChange,
                object: self,
                userInfo: ["balance": balance]
            )
        }
    }
    
    func currentMoney() -> Int {
        return balance
    }
    
    mutating func subtract(price: Money) {
        balance -= price.balance
    }
    
    mutating func plus(money: Money) {
        balance += money.balance
    }
    
    func isMoreThan(money: Money) -> Bool {
        return balance >= money.balance
    }
}
