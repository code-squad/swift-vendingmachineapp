//
//  Machine.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

struct Machine {
    private var moneyStorage = MoneyStorage()
    
    func increaseMoney(by amount: Int) {
        moneyStorage.increaseMoney(amount)
    }
    
    func showBalance() {
        moneyStorage.exportCurrentBalance()
    }
}
