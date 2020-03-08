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
    
    init(_ money: Int) {
        self.money = money
    }
    
    func add(money: Int) {
        self.money += money
    }
    
    func isCheaper(than price: Price) -> Bool {
        return price.money >= self.money
    }
}
