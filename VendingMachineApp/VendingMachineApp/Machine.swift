//
//  Machine.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

struct Machine {
    private var moneyStorage = MoneyStorage()
    private var beverageStorage = BeverageStorage()
    private var cashInteractor = CashInteractor()
    
    //현금보관소에 현금 충전
    func increaseCashInMoneyStorage(by amount: Int) {
        moneyStorage.increaseMoney(by: amount)
    }
    
    func showBalance() {
        moneyStorage.exportCurrentBalance()
    }
    
    func addStock(beverage: Beverage, count: Int) {
        beverageStorage.addStock(with: beverage, amount: count)
    }
    
    func checkStock() {
        print(beverageStorage.showStock())
    }
    
    //사용자가 현금 투입
    func receiveMoney(amount: Int) {
        cashInteractor.dispositCash(money: amount)
    }
    
    func showBalanceInCashInteractor() {
        print(cashInteractor.showBalance())
    }
    
    func showPurchasables() {
        let receivedMoney = cashInteractor.showBalance()
        print(beverageStorage.showPurchasableBeverages(with: receivedMoney))
    }
    
    func transactionStopButtonPressed() {
        let balance = cashInteractor.showBalance()
        moneyStorage.sendMoney(amount: balance, to: cashInteractor)
        let change = cashInteractor.returnChangeToCustomer()
        print("\(change)를 반환하였습니다.")
        cashInteractor.resetCashInteractor()
        print("거래 끝")
    }
    
    //사용자는 현금과 특정버튼을 입력
    func purchaseBeverage(insert money: Int, index: Int) {
        receiveMoney(amount: money)
        cashInteractor.sendMoney(amount: money, to: moneyStorage)
        showPurchasables()
        if let beverage = beverageStorage.putSelectedBeverageOut(at: index) {
            print("\(beverage)가 나왔습니다")
            cashInteractor.deductBalance(with: beverage.checkPrice())
        } else { print("올바른 인덱스를 입력해 주세요") }
        showBalanceInCashInteractor()
        print()
        showPurchasables()
        print()
        checkStock()
    }
}
