//
//  MoneyStorage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class MoneyProcessingUnit: NSObject, NSCoding {
    private var moneyOnTransaction: Int
    
    override init() {
        self.moneyOnTransaction = 0
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(moneyOnTransaction, forKey: "moneyOnTransaction")
    }
    
    required init?(coder: NSCoder) {
        moneyOnTransaction = coder.decodeInteger(forKey: "moneyOnTransaction")
    }
    
    public func increaseMoneyOnTransaction(by amount: Int) {
        moneyOnTransaction += amount
        NotificationCenter.default.post(name: .didIncreaseMoneyOnTransaction, object: nil)
    }
    
    public func deductMoneyOnTransaction(with amount: Int) {
        moneyOnTransaction -= amount
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
