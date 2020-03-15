//
//  Money.swift
//  VendingMachineApp
//
//  Created by delma on 2020/03/07.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Money: NSObject, NSCoding {

    private var balance: Int {
        didSet {
            postNotification()
        }
    }
    
    enum MoneyUnit: Int {
        case fiveThousand = 5000
        case thousand = 1000
        case fiveHundred = 500
        case hundred = 100
    }
    
    init(balance: Int = 0) {
        self.balance = balance
    }
    
    required init?(coder: NSCoder) {
        self.balance = coder.decodeInteger(forKey: "moneyBalance")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.balance, forKey: "moneyBalance")
    }
    
    func postNotification() {
        NotificationCenter.default.post(name: .balanceChanged, object: nil, userInfo: ["balance":"\(balance)"])
    }
        
    func raiseMoney(moneyUnit: MoneyUnit) {
        balance += moneyUnit.rawValue
    }
    
    func confirmBalance(_ money: Money) {
        balance = money.balance + self.balance
    }
    
    func subtract(_ price: Money) {
        balance = self.balance - price.balance
    }
    
    override var description: String {
        "\(balance)"
    }
    
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.balance == rhs.balance
    }
    
    static func - (lhs: Money, rhs: Money) -> Int {
        return lhs.balance - rhs.balance
    }

    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.balance < rhs.balance
    }
    
    static func + (lhs: Money, rhs: Money) -> Int {
        return lhs.balance + rhs.balance
    }
    
}
