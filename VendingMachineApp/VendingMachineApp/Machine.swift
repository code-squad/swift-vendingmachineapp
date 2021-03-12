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
    
    func receiveMoney(amount: Int) {
        moneyProccesor.increaseMoneyOnTransaction(by: amount)
    }
    
    func showInsertedCashBalance() -> Int {
        return moneyProccesor.moneyOnTransactionAmount()
    }
    
    func addStock(beverage: Beverage, amount: Int) {
        beverageStorage.increaseStock(beverage: beverage, by: amount)
    }
    
    func checkStock() -> [Beverage: Int] {
        return beverageStorage.checkStock()
    }
    
    func showPurchasables(with money: Int) -> [Beverage: Int] {
        return beverageStorage.checkPurchasables(with: money)
    }
    
    func showExpired(on date: Date) -> [Beverage: Int] {
        return beverageStorage.checkExpired(on: date)
    }
    
    mutating func purchaseBeverage(beverage: Beverage) {
        let itemPrice = beverage.showPrice()
        guard itemPrice <= moneyProccesor.moneyOnTransactionAmount() else { return }
            beverageStorage.decreaseStock(beverage: beverage) {result in
                switch result {
                case .success(let deductedBeverage):
                    moneyProccesor.deductMoneyOnTransaction(with: itemPrice)
                    savePurchaseHistory(beverage: deductedBeverage)
                case .failure(let error):
                    print(error.localizedDescription)
                    return
                }
            }
    }

    mutating func transactionStopButtonPressed() -> Int {
        resetPurchaseHistory()
        return moneyProccesor.returnChanges()
    }
    
    mutating private func savePurchaseHistory(beverage: Beverage) {
        purchaseHistory.append(beverage)
    }
    
    mutating private func resetPurchaseHistory() {
        purchaseHistory = []
    }
    
    mutating public func showPurchaseHistory() -> [Beverage] {
        return purchaseHistory
    }
}
