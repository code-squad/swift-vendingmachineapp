//
//  Price.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/03/08.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Price {
    private var money: Int
    private let moneyList = [1000, 5000]
    
    init(_ money: Int) {
        self.money = money
    }
    
    init(_ money: String) {
        if let money = Int(money) {
            self.money = money
        } else {
            self.money = 0
        }
    }
    
    func add(moneyNumber: Int) {
        money += moneyList[moneyNumber]
    }
    
    func add(money: Price) {
        if let money = Int("\(money)"){
            self.money += money
        }
    }
    
    func minus(money: Price) {
        if let money = Int("\(money)"){
            self.money -= money
        }
    }
    
    func isCheaper(than price: Price) -> Bool {
        return price.money >= self.money
    }
}

extension Price: CustomStringConvertible {
    var description: String {
        return String(money)
    }
}
