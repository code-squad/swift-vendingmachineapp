//
//  CashManagementSystem.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/25.
//

import Foundation

class CashManagementSystem {
    private var cash: Int = 0
    
    func recharge(with cash: Int) {
        self.cash = cash
    }
    func showListForPurchase(with drinks: Drinks) ->[Beverage] {
        return drinks.showListForPurchase(with: cash)
    }
    
    func checkBalance() {
        
    }
    
    func printPurchasedDrinks() {
        
    }
}
