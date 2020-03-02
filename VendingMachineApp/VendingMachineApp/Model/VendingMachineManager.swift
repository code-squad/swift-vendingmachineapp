//
//  VendingMachineManager.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

protocol SomeDelegate: class {
    var stockNames: [String] { get }
    func addBalance(amount: Int)
    func checkBalance() -> Money
    func addStock(index: Int)
}

class VendingMachineManager {
    weak var anyDelegate: AnyDelegate?
    var vendingMachine = VendingMachine() {
        didSet {
            updateVendingMachine()
        }
    }
    
    func updateVendingMachine() {
        anyDelegate?.updateBalanceLabel(amount: "\(checkBalance())")
        anyDelegate?.updateStockCountLabels(stockList: vendingMachine.stockList)
    }
}

extension VendingMachineManager: SomeDelegate {
    var stockNames: [String] {
        vendingMachine.stockList.map { $0.key.name }
    }
    
    func addBalance(amount: Int) {
        vendingMachine.addBalance(Money(amount: amount))
    }
    func checkBalance() -> Money {
        vendingMachine.checkBalance()
    }
    func addStock(index: Int) {
        vendingMachine.addBeverage(beverage: vendingMachine.stockList[index].key)
    }
}
