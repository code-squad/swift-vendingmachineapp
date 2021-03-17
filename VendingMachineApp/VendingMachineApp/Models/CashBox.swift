//
//  CashBox.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/08.
//

import Foundation

class CashBox: NSObject, NSCoding {
    private var totalRevenue: Int
    private var moneyDeposited: Int
    
    init(totalRevenue: Int, moneyDeposited: Int) {
        self.totalRevenue  = totalRevenue
        self.moneyDeposited = moneyDeposited
    }
    
    struct PropertyKey {
        static let totalRevenueKey = "totalRevenue"
        static let moneyDepositedKey = "moneyDeposited"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(totalRevenue, forKey: PropertyKey.totalRevenueKey)
        coder.encode(moneyDeposited, forKey: PropertyKey.moneyDepositedKey)
    }
    
    required init?(coder: NSCoder) {
        self.totalRevenue = coder.decodeInteger(forKey: PropertyKey.totalRevenueKey)
        self.moneyDeposited = coder.decodeInteger(forKey: PropertyKey.moneyDepositedKey)
    }
    
    func insertMoney(amount: Int) {
        moneyDeposited += amount
    }
    
    func increaseRevenue(by amount: Int) {
        moneyDeposited -= amount
        totalRevenue += amount
    }
    
    func showRemainingBalance() -> Int {
        return moneyDeposited
    }
}
