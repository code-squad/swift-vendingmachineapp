//
//  Money.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/12.
//

import Foundation

enum Cash: Int {
    case coin = 100
    case coins = 500
    case bill = 1000
    case bills = 5000
}

class Money: NSObject, NSCoding {
    private(set) var cash: Int
    
    override init(){
        cash = 0
    }
    
    required init?(coder decoder: NSCoder) {
        cash = decoder.decodeInteger(forKey: "cash")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(cash, forKey: "cash")
    }
    
    func add(_ cash: Cash) -> Int {
        self.cash += cash.rawValue
        return self.cash
    }
    
    func sub(_ money: Int) -> Int {
        self.cash -= money
        return self.cash
    }
}
