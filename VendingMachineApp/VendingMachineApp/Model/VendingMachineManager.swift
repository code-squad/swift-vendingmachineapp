//
//  VendingMachineManager.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

protocol VendingMachineManagementDelegate: class {
    var stockNames: [String] { get }
    func addBalance(amount: Int)
    func checkBalance() -> Money
    func addStock(index: Int)
}

class VendingMachineManager {
    weak var mainViewUpdater: MainViewUpdaterDelegate?
    private var vendingMachine = VendingMachine() {
        didSet {
            updateVendingMachine()
        }
    }
    
    func updateVendingMachine() {
        mainViewUpdater?.updateBalanceLabel(amount: "\(checkBalance())")
        mainViewUpdater?.updateStockCountLabels(stockList: vendingMachine.stockList)
    }
}

extension VendingMachineManager: VendingMachineManagementDelegate {
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
