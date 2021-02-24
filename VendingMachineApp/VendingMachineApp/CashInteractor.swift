//
//  MoneyReceiver.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class CashInteractor: MoneyExchangable {
    var money: Int
    private var balance: Int
    
    init() {
        money = 0
        balance = 0
    }
    
    func resetCashInteractor() {
        money = 0
        balance = 0
    }
    
    func increaseMoney(by amount: Int) {
        money += amount
    }
    
    func deductMoney(by amount: Int) {
        money -= amount
    }
    
    func sendMoney(amount: Int, to counterPart: MoneyExchangable) {
        self.deductMoney(by: amount)
        counterPart.increaseMoney(by: amount)
    }
    
    public func dispositCash(money: Int) {
        self.money += money
        self.balance += money
    }
    
    public func showBalance() -> Int {
        return balance
    }
    
    public func deductBalance(with amount: Int) {
        self.balance -= amount
    }
    
    public func returnChangeToCustomer() -> Int {
        return money
    }
}
