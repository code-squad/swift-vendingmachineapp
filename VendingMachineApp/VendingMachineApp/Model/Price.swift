//
//  Price.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/03/08.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Price {
    private(set) var money: Int
    private let moneyList = [1000, 5000]
    
    init(_ money: Int) {
        self.money = money
    }
    
    func add(moneyNumber: Int) {
        money += moneyList[moneyNumber]
    }
    
    func add(money: Int) {
        self.money += money
    }
    
    func isCheaper(than price: Price) -> Bool {
        return price.money >= self.money
    }
}
