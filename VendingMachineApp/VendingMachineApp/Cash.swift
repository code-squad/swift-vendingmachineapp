//
//  Cash.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

class Cash: NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    private var balance: Int
    
    override init() {
        self.balance = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.balance = aDecoder.decodeInteger(forKey: "balance")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.balance, forKey: "balance")
    }
    
    public func addBalance(with money: Int) {
        self.balance += money
        
        // 옵저버 알림
        let name = Notification.Name(NotificationKey.updateBalance)
        NotificationCenter.default.post(name: name, object: nil)
    }
    
    public func presentBalance() -> Int {
        return self.balance
    }
    
    public func remove(with money: Int) {
        self.balance -= money
        
        // 옵저버 알림
        let name = Notification.Name(NotificationKey.updateBalance)
        NotificationCenter.default.post(name: name, object: nil)
    }
}
