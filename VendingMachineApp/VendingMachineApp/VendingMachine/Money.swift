//
//  Balance.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 11..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

class Money: NSObject, NSCoding {
    
    //MARK: - Keys
    
    private let moneyKey: String = "money"
    
    //MARK: Encode, Decode
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(money, forKey: self.moneyKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(money: 0)
        money = aDecoder.decodeInteger(forKey: self.moneyKey)
    }
    
    //MARK: Initialization
    
    init(money: Int = 0) {
        self.money = money
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private var money: Int {
        didSet {
            let userInfo = [UserInfoKey.balance: self]
            NotificationCenter.default.post(name: .didChangeBalance, object: nil, userInfo: userInfo)
        }
    }
    
    //MARK: - Methods
    
    func insert(money: MoneyUnit) {
        self.money += money.rawValue
    }
    
    func updateBalance(update: (String) -> Void) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        update(formatter.string(from: self.money as NSNumber) ?? "")
    }
    
    func pay(price: Money) {
        self.money = self.money - price.money
    }
    
    func updateBalanceLabel(update: (Int) -> Void) {
        update(self.money)
    }
}

extension Money {
    
    static func >(lhs: Money, rhs: Money) -> Bool {
        return lhs.money > rhs.money
    }
}
