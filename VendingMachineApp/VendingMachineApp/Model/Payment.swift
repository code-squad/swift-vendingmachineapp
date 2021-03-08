//
//  Payment.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/24.
//

import Foundation

class Payment : NSObject, NSCoding {
    private(set) var amountMoney : Int
    
    override init() {
        self.amountMoney = 0
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(amountMoney, forKey: "amountMoney")
    }
    
    required init?(coder: NSCoder) {
        self.amountMoney = coder.decodeInteger(forKey: "amountMoney")
    }
        
    func purchasePossibleList(drinks : Drinks) -> [Beverage] {
        return drinks.purchasePossibleList(money: amountMoney)
    }
    
    func canPurchase(beverage : Beverage) -> Bool {
        return beverage.isPossiblePurchase(money: amountMoney)
    }
    
    func increase(money : Int) {
        self.amountMoney += money
    }
    
    func decrease(beverage : Beverage) {
        amountMoney = beverage.decreaseBlance(money: amountMoney)
    }
}
