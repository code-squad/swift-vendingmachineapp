//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol VendingMachineDelegate: class {
    var bundles: BeverageBundles { get }
}

protocol VendingMachineManagerDelegate: VendingMachineDelegate {
    func add(_ beverage: Beverage)
    func remove(at index: Int) throws -> Beverage
}

protocol VendingMachineUserDelegate: VendingMachineDelegate {
    var userHistory: History { get }
    var remain: Int { get }
    func deposit(_ money: Int)
    func buy(at index: Int) throws -> (Beverage, Int)
}

protocol VendingMachineHandlerDelegate: class {
    associatedtype Menu
    func handle(_ menu: Menu, value: Int) throws -> Comment?
}

class VendingMachine {
    private var stocks: Stocks
    private var account: Int = 0
    private var history = History()
    
    init(_ stocks: Stocks) {
        self.stocks = stocks
    }
    
    // 현재 잔액으로 구매할 수 있는 음료 목록
    func availables(with money: Int) -> [Beverage] {
        return stocks.availables(with: money)
    }
}

extension VendingMachine: VendingMachineDelegate {
    var bundles: BeverageBundles {
        return stocks.bundles
    }
}

extension VendingMachine: VendingMachineManagerDelegate {
    func add(_ beverage: Beverage) {
        stocks.append(beverage)
    }
    
    func remove(at index: Int) throws -> Beverage {
        let beverage = try bundles.get(at: index)
        try stocks.remove(at: beverage)
        return beverage
    }
}

extension VendingMachine: VendingMachineUserDelegate {
    var userHistory: History {
        return history
    }
    var remain: Int {
        return account
    }
    func deposit(_ money: Int) {
        account += money
    }
    // 음료수 구매 메소드
    func buy(at index: Int) throws -> (Beverage, Int) {
        let beverage = try bundles.get(at: index)
        let price = try stocks.buy(at: beverage, account)
        account -= price
        history.append(beverage)
        return (beverage, price)
    }
}
