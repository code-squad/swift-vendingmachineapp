//
//  Balance.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 11..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

class Balance: NSObject, NSCoding {
    
    //MARK: - Keys
    
    private let balanceKey: String = "balance"
    
    //MARK: Encode, Decode
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: self.balanceKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        balance = aDecoder.decodeInteger(forKey: self.balanceKey)
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private var balance: Int = 0 {
        didSet {
            let userInfo = [UserInfoKey.balance: self]
            NotificationCenter.default.post(name: .didChangeBalance, object: nil, userInfo: userInfo)
        }
    }
    
    //MARK: - Methods
    
    func insert(money: Money) {
        self.balance += money.rawValue
    }
    
    func updateBalance(update: (String) -> Void) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        update(formatter.string(from: self.balance as NSNumber) ?? "")
    }
    
    func pay(beverage: Beverage) {
        let pay: (Int, Int) -> Int = { (balance: Int, price: Int) -> Int in
                return balance - price
        }
        balance = beverage.pay(balance: balance, pay: pay)
    }
    
    func updateBalanceLabel(update: (Int) -> Void) {
        update(self.balance)
    }
    
    func isBuyable(_ isBuyable: (Int) -> Bool) -> Bool {
        return isBuyable(balance)
    }
}
