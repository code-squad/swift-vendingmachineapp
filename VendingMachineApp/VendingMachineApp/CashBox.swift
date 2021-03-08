//
//  CashBox.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/08.
//

import Foundation

struct CashBox {
    private var totalRevenue: Int
    private var moneyDeposited: Int
    
    init(totalRevenue: Int, moneyDeposited: Int) {
        self.totalRevenue  = totalRevenue
        self.moneyDeposited = moneyDeposited
    }
    
    mutating func insertMoney(amount: Int) {
        moneyDeposited += amount
    }
    
    mutating func increaseRevenue(by amount: Int) {
        moneyDeposited -= amount
        totalRevenue += amount
    }
    
    func showRemainingBalance() -> Int {
        return moneyDeposited
    }
}
