//
//  PaymentManager.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/02.
//

import Foundation

class PaymentManager: NSObject, NSCoding {
 
    private(set) var money: Int
    
    override init() {
        money = 0
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(money, forKey: "money")
    }
    
    required init?(coder: NSCoder) {
        money = coder.decodeInteger(forKey: "money")
    }
    
    public func increase(_ money: Money) {
        self.money += money.rawValue
    }
    
    public func decreaseMoney(by beverage: Beverage) {
        self.money -= beverage.price
    }
}

enum Money: Int, CustomStringConvertible {
    var description: String {
        return "\(rawValue)"
    }
    
    case fiveThousand = 5000
    case thousand = 1000
}
