//
//  Cashier.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/11.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol Calculable {
    mutating func subtract(price: Int)
    mutating func plus(money: Int)
    func isEnoughToBuy(price: Int) -> Bool
    func currentBalance() -> Int
}

struct Cashier: Calculable {
    enum Notification {
        static let balanceDidChange = Foundation.Notification.Name("balanceDidChange")
    }
    
    private var balance = Quantity.zero {
        didSet {
            NotificationCenter.default.post(
                name: Notification.balanceDidChange,
                object: self,
                userInfo: ["balance": balance]
            )
        }
    }
    
    func currentBalance() -> Int {
        return balance
    }
    
    mutating func subtract(price: Int) {
        balance -= price
    }
    
    mutating func plus(money: Int) {
        balance += money
    }
    
    func isEnoughToBuy(price: Int) -> Bool {
        return balance >= price
    }
}
