//
//  MoneyStorage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class MoneyProcessingUnit {
    enum MoneyProcessingError: Error {
        case notEnoughMoneyOnTransactionError
    }
    
    
    private var holding: Int
    private var moneyOnTransaction: Int
    
    init() {
        self.holding = 0
        self.moneyOnTransaction = 0
    }
    
    public func increaseHolding(by amount: Int) {
        holding += amount
    }
    
    public func increaseMoneyOnTransaction(by amount: Int) {
        moneyOnTransaction += amount
    }
    
    public func deductMoneyOnTransaction(by amount: Int) throws {
        if moneyOnTransaction - amount < 0 {
            throw MoneyProcessingError.notEnoughMoneyOnTransactionError
        } else {
            moneyOnTransaction -= amount
        }
    }
    
    public func holdingAmount() -> Int {
        return holding
    }
    
    public func moneyOnTransactionAmount() -> Int {
        return moneyOnTransaction
    }
    
    public func returnChanges() -> Int {
        let change = moneyOnTransaction
        moneyOnTransaction = 0
        return change
    }
}
