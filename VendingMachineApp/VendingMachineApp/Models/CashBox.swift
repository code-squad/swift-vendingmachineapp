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
    
    func encode(with coder: NSCoder) {
        coder.encode(totalRevenue, forKey: "totalRevenue")
        coder.encode(moneyDeposited, forKey: "moneyDeposited")
    }
    
    required init?(coder: NSCoder) {
        self.totalRevenue = coder.decodeInteger(forKey: "totalRevenue")
        self.moneyDeposited = coder.decodeInteger(forKey: "moneyDeposited")
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
