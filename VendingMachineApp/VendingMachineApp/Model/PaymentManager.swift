//
//  PaymentManager.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/02.
//

import Foundation

class PaymentManager {
    
    private(set) var money: Int
    
    init() {
        money = 0
    }
    
    public func increase(_ money: Int) {
        self.money += money
    }
    
    public func decreaseMoney(by beverage: Beverage) {
        self.money -= beverage.price
    }
}
