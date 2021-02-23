//
//  MoneyStorage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class MoneyStorage {
    private var money: Int
    
    init() {
        money = 100_000
    }
    
    public func increaseMoney(_ amount: Int) {
        money += amount
    }
    
    public func exportCurrentBalance() {
        print("\(money)")
    }
}
