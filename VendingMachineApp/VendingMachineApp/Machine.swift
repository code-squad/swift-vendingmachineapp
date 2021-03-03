//
//  Machine.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

struct Machine {
    private var moneyProccesor = MoneyProcessingUnit()
    private var beverageStorage = BeverageStorage()
    private var purchaseHistory = [Beverage]()
    //MARK:- Money processor related methods
    func addMoneyHolding(by amount: Int) {
        moneyProccesor.increaseHolding(by: amount)
    }
    
    func showMoneyHolding() -> Int {
        return moneyProccesor.holdingAmount()
    }
    
    //사용자가 현금 투입
    func receiveMoney(amount: Int) {
        moneyProccesor.increaseMoneyOnTransaction(by: amount)
    }
    
    func showInsertedCashBalance() -> Int {
        return moneyProccesor.moneyOnTransactionAmount()
    }
    
    //MARK:- Beverage storage related methods
    func addStock(beverage: Beverage, amount: Int) {
        beverageStorage.increaseStock(beverage: beverage, by: amount)
    }
    
    func checkStock() -> [Beverage: Int] {
        return beverageStorage.checkStock()
    }
    
    func showPurchasables(with money: Int) -> [Beverage: Int] {
        return beverageStorage.checkPurchasables(with: money)
    }
    
    func showExpired() -> [Beverage: Int] {
        return beverageStorage.checkExpired()
    }
    
    mutating func purchaseBeverage(beverage: Beverage) {
        let itemPrice = beverage.checkPrice()
        do {
            try moneyProccesor.deductMoneyOnTransaction(by: itemPrice)
        } catch {
            return
        }
        moneyProccesor.increaseHolding(by: itemPrice)
        do {
            try beverageStorage.decreaseStock(beverage: beverage)
        } catch {
            print("Invalid beverage info")
        }
        savePurchaseHistory(beverage: beverage)
    }

    mutating func transactionStopButtonPressed() -> Int {
        resetPurchaseHistory()
        return moneyProccesor.returnChanges()
    }
    
    mutating public func savePurchaseHistory(beverage: Beverage) {
        purchaseHistory.append(beverage)
    }
    
    private mutating func resetPurchaseHistory() {
        purchaseHistory = []
    }
    
    func showPurchaseHistory() -> [Beverage] {
        return purchaseHistory
    }
}
