//
//  MoneyManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class MoneyManager: NSObject, NSSecureCoding {
    private var balance: Int {
        didSet {
            NotificationCenter.default.post(name: .didChangeBalance, object: self, userInfo: ["balance":balance])
        }
    }
    
    func readBalance() -> Int {
        return self.balance
    }
    
    private init(_ balance: Int) {
        self.balance = balance
    }
    
    override init() {
        self.balance = 0
        super.init()
    }
    
    func increaseBalance(_ price: Int) {
        self.balance += price
    }
    
    func decreaseBalance(_ price: Int) {
        self.balance -= price
    }
    
    func isPurchasable(_ price: Int) -> Bool {
        return price <= balance
    }

    // MARK: NSSecureCoding
    private struct NSCoderKeys {
        static let balanceKey = "balance"
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(NSNumber(value: balance), forKey: NSCoderKeys.balanceKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let balance = aDecoder.decodeObject(of: NSNumber.self, forKey: NSCoderKeys.balanceKey) else {
            return nil
        }
        self.balance = balance.intValue
    }
}
