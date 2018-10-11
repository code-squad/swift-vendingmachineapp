//
//  Cash.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

class Cash: NSObject, NSCoding {
    private var balance: Int
    
    override init() {
        self.balance = 0
    }
    
    public func addBalance(with money: Int) {
        self.balance += money
    }
    
    public func presentBalance() -> Int {
        return self.balance
    }
    
    public func remove(with money: Int) {
        self.balance -= money
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.balance, forKey: "balance")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.balance = aDecoder.decodeInteger(forKey: "balance")
    }
}
