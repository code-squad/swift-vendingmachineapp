//
//  Machine.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Machine: NSObject, NSCoding {
    public var moneyProcessor: MoneyProcessingUnit
    public var beverageStorage: BeverageStorage
    private var purchaseHistory: [Beverage]
    
    
    init(moneyProcessor: MoneyProcessingUnit, beverageStorage: BeverageStorage, purchaseHistory: [Beverage]) {
        self.moneyProcessor = moneyProcessor
        self.beverageStorage = beverageStorage
        self.purchaseHistory = purchaseHistory
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(moneyProcessor, forKey: "moneyProcessor")
        coder.encode(beverageStorage, forKey: "beverageStorage")
        coder.encode(purchaseHistory, forKey: "purchaseHistory")
    }
    
    required convenience init?(coder eDecoder: NSCoder) {
        guard let moneyProccesor = eDecoder.decodeObject(forKey: "moneyProcessor") as? MoneyProcessingUnit,
              let beverageStorage = eDecoder.decodeObject(forKey: "beverageStorage") as? BeverageStorage,
              let purchaseHistory = eDecoder.decodeObject(forKey: "purchaseHistory") as? [Beverage] else { return nil }
        self.init(moneyProcessor: moneyProccesor, beverageStorage: beverageStorage, purchaseHistory: purchaseHistory)
    }
    
    override init() {
        self.moneyProcessor = MoneyProcessingUnit()
        self.beverageStorage = BeverageStorage()
        self.purchaseHistory = [Beverage]()
    }
    
    enum MoneyAmount: Int {
        case thousandWon = 1_000
        case fiveThousandWon = 5_000
    }
    
    func receiveMoney(amount: MoneyAmount) {
        moneyProcessor.increaseMoneyOnTransaction(by: amount.rawValue)
    }
    
    func showInsertedCashBalance() -> Int {
        return moneyProcessor.moneyOnTransactionAmount()
    }
    
    func addStock(beverage: Beverage, amount: Int) {
        beverageStorage.addStock(beverage: beverage, count: amount)
    }
    
    func increaseStock(beverage: Beverage, amount: Int) {
        beverageStorage.increaseStock(beverage: beverage, by: amount)
    }
    
    func checkStock() -> [Item] {
        return beverageStorage.stock
    }
    
    func checkSpecificTypeOfBeverage(beverage: Beverage) -> Int {
       return beverageStorage.checkSpecificBeverageCount(beverage: beverage)
    }
    
    func showPurchasables(with money: Int) -> [Item] {
        return beverageStorage.checkPurchasables(with: money)
    }

    func showExpired(on date: Date) -> [Item] {
        return beverageStorage.checkExpired(on: date)
    }
    
    func purchaseBeverage(beverage: Beverage) {
        let itemPrice = beverage.showPrice()
        guard itemPrice <= moneyProcessor.moneyOnTransactionAmount() else { return }
            beverageStorage.decreaseStockByOne(beverage: beverage) {result in
                switch result {
                case .success(let deductedBeverage):
                    moneyProcessor.deductMoneyOnTransaction(with: itemPrice)
                    savePurchaseHistory(beverage: deductedBeverage)
                    print(purchaseHistory)
                    NotificationCenter.default.post(name: .didChangePurchaseHistory, object: self)
                case .failure(_):
                    return
                }
            }
    }

    func transactionStopButtonPressed() -> Int {
        resetPurchaseHistory()
        return moneyProcessor.returnChanges()
    }
    
    private func savePurchaseHistory(beverage: Beverage) {
        purchaseHistory.append(beverage)
    }
    
    private func resetPurchaseHistory() {
        purchaseHistory = []
    }
    
    public func showPurchaseHistory() -> [Beverage] {
        return purchaseHistory
    }
}
