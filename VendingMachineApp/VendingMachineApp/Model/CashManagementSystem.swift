//
//  CashManagementSystem.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/25.
//

import Foundation

class CashManagementSystem: NSObject, NSCoding {
    private var cash: Int
    
    override var description : String {
        return "\(self.cash)"
    }
    
    init(_ cash: Int) {
        self.cash = cash
    }
    convenience override init() {
        self.init(0)
    }
    
    required init?(coder: NSCoder) {
        cash = coder.decodeInteger(forKey: "cash")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(cash, forKey: "cash")
    }
    
    func retrieveCash(completion: (Int) -> Drinks) -> Drinks {
        return completion(cash)
    }
    
    func checkBalance() -> CashManagementSystem {
        return CashManagementSystem(cash)
    }
    
    func isAvailableForPurchase(with beverage: Beverage) -> Bool {
        beverage.isAvailablePurchase(with: self.cash)
    }
    
    func increaseCash(with amount: Int) {
        self.cash += amount
    }
    
    func decreaseCash(with beverage: Beverage) {
        self.cash = beverage.calculateChange(with: cash)
    }
}



