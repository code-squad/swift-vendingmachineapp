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
    private var paymentValidator = PaymentValidator()
    
    //MARK:- MONEY STORAGE BEHAVIORS
    func increaseMoney(by amount: Int) {
        moneyStorage.increaseMoney(amount)
    }
    
    func showBalance() {
        moneyStorage.exportCurrentBalance()
    }
    //MARK:- BEVERAGE STOCK BEHAVIORS
    func addStock(beverage: Beverage, count: Int) {
        beverageStorage.addStock(with: beverage, amount: count)
    }
    
    func checkStock() {
        print(beverageStorage)
    }
    //MARK:- PAYMENT VALIDATOR BEHAVIORS
    func receiveMoney(amount: Int) {
        paymentValidator.receive(money: amount)
    }
    
    //MARK:- COMBINED BEHAVIORS
    func showPurchasables() {
        let receivedMoney = paymentValidator.showsDeposit()
        print(beverageStorage.showPurchasableBeverage(with: receivedMoney))
    }
}
