//
//  Money.swift
//  VendingMachine
//
//  Created by Elena on 15/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Money {
    private var money: Int

    init(money: Int) {
        self.money = money
    }

    func addMoney(put: Int) -> Bool {
        guard put > 0 else { return false }
        self.money += put
        return true
    }

    func isBuy(money: Int) -> Bool {
        return self.money >= money
    }

    func subtract(price: Int) {
        self.money -= price
    }

    func showMoney() -> Int {
        return money
    }
}

extension Int {
    // , 를 위해 구현
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var commaRepresentation: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
