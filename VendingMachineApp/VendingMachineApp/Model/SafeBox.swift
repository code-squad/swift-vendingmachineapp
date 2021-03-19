//
//  SafeBox.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/02.
//

import Foundation

class SafeBox : NSObject, NSCoding {
    private var money : Int
    
    init(money : Int) {
        self.money = money
    }
    
    required init?(coder: NSCoder) {
        money = coder.decodeInteger(forKey: "money")
    }
    
    func encode(with coder : NSCoder) {
        coder.encode(money, forKey: "money")
    }
    
    func deposit(howMuch won : Int) {
        self.money += won
    }
    
    func withdrawal(howMuch won : Int) -> Bool {
        if won > money {
            return false
        }
        
        money -= won
        
        return true
    }
    
    func checkBalance() -> Int {
        return money
    }
}
