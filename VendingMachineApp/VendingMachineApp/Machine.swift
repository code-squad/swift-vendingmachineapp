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
    func addStock(beverage: Beverage, count: Int) {
        beverageStorage.addStock(with: beverage, amount: count)
    }
    
    func checkStock() {
        print(beverageStorage.showStock())
    }
    
    func showPurchasables() {
        let receivedMoney = cashValidator.showBalance()
        print(beverageStorage.showPurchasableBeverages(with: receivedMoney))
    }
    
    func showExpired() {
        print(beverageStorage.showExpiredBeverages())
    }
    
    //사용자는 특정버튼을 입력
    func purchaseBeverage(index: Int) {
        if let beverage = beverageStorage.putSelectedBeverageOut(at: index) {
            print("\(beverage)가 나왔습니다")
            cashValidator.deductBalance(with: beverage.checkPrice())
        } else {
            print("올바른 인덱스를 입력해 주세요")
        }
    }

    func transactionStopButtonPressed() {
        let balance = cashValidator.showBalance()
        moneyStorage.sendMoney(amount: balance, to: cashValidator)
        let change = cashValidator.returnChangeToCustomer()
        print("\(change)를 반환하였습니다.")
        cashValidator.resetCashInteractor()
    }
}
