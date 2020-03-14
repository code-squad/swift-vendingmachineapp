//
//  Price.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/03/08.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Price: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(money, forKey: Property.money)
    }
    
    required init?(coder decoder: NSCoder) {
        self.money = decoder.decodeInteger(forKey: Property.money)
    }
    
    private var money: Int {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.updateBalance, object: nil)
        }
    }
    
    override var description: String {
        return String(money)
    }
    
    enum KindOfMoney: Int, CaseIterable {
        case TenThousand = 1000
        case FiftyThounsand = 5000
        case Zero = 0
        
        init(amount: Int) {
            if amount >= 0 && amount < KindOfMoney.allCases.count {
                self = KindOfMoney.allCases[amount]
            } else {
                self = KindOfMoney.Zero
            }
        }
        
        func add(_ price: Int) -> Int {
            return price + self.rawValue
        }
    }
    
    init(_ money: Int) {
        self.money = money
    }
    
    init(_ money: String) {
        if let money = Int(money) {
            self.money = money
        } else {
            self.money = 0
        }
    }
    
    func add(money: KindOfMoney) {
        self.money = money.add(self.money)
    }
    
    func add(money: Price) {
        if let money = Int("\(money)"){
            self.money += money
        }
    }
    
    func minus(money: Price) {
        if let money = Int("\(money)"){
            self.money -= money
        }
    }
    
    func isCheaper(than price: Price) -> Bool {
        return price.money >= self.money
    }
}
