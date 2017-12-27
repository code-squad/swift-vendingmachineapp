//
//  VendingMachineData.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 18..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class VendingMachineData {
    private (set) var stock: [Beverage]
    private (set) var sortedStockList = [Beverage: Int]()
    private (set) var balance: Int
    convenience init() {
        self.init(stock: [])
    }
    init(stock: [Beverage]) {
        self.stock = stock
        self.balance = 0
        for item in stock {
            self.makeBeverageList(item)
        }
    }
    private func makeBeverageList(_ item: Beverage) {
        if sortedStockList[item] != nil {
            sortedStockList[item]! += 1
        } else {
            sortedStockList[item] = 1
        }
    }
    init(stock: [Beverage], stockList: [Beverage: Int], balance: Int) {
        self.stock = stock
        self.sortedStockList = stockList
        self.balance = balance
    }
    convenience init(stock: [Beverage], stockList: [Beverage: Int]) {
        self.init(stock: stock, stockList: stockList, balance: 0)
    }
    func insertMoney(_ money: Int) {
        balance += money
    }
    func processBuying(_ selectedValue: Beverage) throws -> Beverage {
        guard let item = stock.index(where: { $0.name == selectedValue.name }) else {
            throw ErrorCode.noStock
        }
        guard selectedValue.checkAvailableList(with: balance) else {
            throw ErrorCode.noMoney
        }
        sortedStockList[selectedValue]! -= 1
        balance -= selectedValue.price
        return stock.remove(at: item)
    }
    func addBeverage(_ item: Beverage) {
        stock.append(item)
        makeBeverageList(item)
    }
    func removeBeverage(_ item: Beverage) throws {
        guard let index = stock.index(where: { $0.name == item.name }) else {
            throw ErrorCode.noStock
        }
        guard index != 0 else {
            throw ErrorCode.noStock
        }
        sortedStockList[item]! -= 1
        stock.remove(at: index)
    }
}
