//
//  CashManagementSystem.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/25.
//

import Foundation

class CashManagementSystem {
    private var cash: Int
    
    var description : String {
        return "\(self.cash)"
    }
    
    init(_ cash: Int) {
        self.cash = cash
    }
    convenience init() {
        self.init(0)
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

extension CashManagementSystem: Equatable {
    static func == (lhs: CashManagementSystem, rhs: CashManagementSystem) -> Bool {
        return lhs.cash == rhs.cash
    }
}
