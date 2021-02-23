//
//  Machine.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

struct Machine {
    private var moneyStorage = MoneyStorage()
    private var beverageStorage = BeverageStorage()
    
    func increaseMoney(by amount: Int) {
        moneyStorage.increaseMoney(amount)
    }
    
    func showBalance() {
        moneyStorage.exportCurrentBalance()
    }
    
    func addStock(beverage: Beverage, count: Int) {
        beverageStorage.addStock(with: beverage, amount: count)
    }
    
    func checkStock() {
        beverageStorage.checkStock()
    }
}
