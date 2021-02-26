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
    
    //MARK:- Money processor related methods
    func increaseHolding(by amount: Int) {
        moneyProccesor.increaseHolding(by: amount)
    }
    
    func showMoneyHolding() {
        print("현재 자판기 안의 현금은 \(moneyProccesor.holdingAmount())")
    }
    
    //사용자가 현금 투입
    func receiveMoney(amount: Int) {
        moneyProccesor.increaseMoneyOnTransaction(by: amount)
    }
    
    func showInsertedCashBalance() {
        print("현재 사용자의 투입 금액 잔액은 \(moneyProccesor.moneyOnTransactionAmount())")
    }
    
    //MARK:- Beverage storage related methods
    func addStock(beverage: Beverage, amount: Int) {
        beverageStorage.increaseStock(beverage: beverage, by: amount)
    }
    
    func checkStock() {
        let stock = beverageStorage.checkStock()
        print(stock)
    }
    
    func showPurchasables(with money: Int) {
        let purchasables = beverageStorage.checkPurchasables(with: money)
        print(purchasables)
    }
    
    func showExpired() {
        let expired = beverageStorage.checkExpired()
        print(expired)
    }
    
    //사용자는 특정버튼을 입력
    func purchaseBeverage(beverage: Beverage) {
        let itemPrice = beverage.checkPrice()
        moneyProccesor.deductMoneyOnTransaction(by: itemPrice)
        moneyProccesor.increaseHolding(by: itemPrice)
        do {
            try beverageStorage.decreaseStock(beverage: beverage)
        } catch {
            print("Invalid beverage info")
        }
        
    }

    func transactionStopButtonPressed() {
        print("잔돈 \(moneyProccesor.returnChanges())원을 반환합니다.")
    }
}
