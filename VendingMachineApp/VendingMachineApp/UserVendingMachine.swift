//
//  UserVendingMachine.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 18..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct UserVendingMachine: UserDelegate {
    private var vendingMachineData: VendingMachineData
    private var recepit = [String]()
    init(with vendingMachineData: VendingMachineData) {
        self.vendingMachineData = vendingMachineData
    }
    mutating func insertMoney(_ money: Int) {
        vendingMachineData.insertMoney(money)
    }
    func getBalance() -> Int {
        return vendingMachineData.balance
    }
    mutating func buyBeverage(number: Int) throws -> Beverage {
        let stockList = vendingMachineData.sortedStockList
        let item = stockList[stockList.index(stockList.startIndex, offsetBy: number - 1)].key
        return try buyBeverage(item)
    }
    mutating func buyBeverage(_ selectedValue: Beverage) throws -> Beverage {
        recepit.append(selectedValue.description)
        return try vendingMachineData.processBuying(selectedValue)
    }
    func getStockList() -> [Beverage: Int] {
        return vendingMachineData.sortedStockList
    }
    func getValidBuyingBeverage() -> [Beverage] {
        let keys = vendingMachineData.sortedStockList.keys.map { $0 }
        return keys.filter { $0.checkAvailableList(with: vendingMachineData.balance) }
    }
    func getHotBeverage() -> [BeverageCheck] {
        let keys = vendingMachineData.sortedStockList.keys.map { $0 }.flatMap { $0 as? BeverageCheck }
        return keys.filter { $0.isHot() }
    }
    func getRecepit() -> [String] {
        return recepit
    }
}
