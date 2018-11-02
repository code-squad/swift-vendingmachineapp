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
    var userHistory: [History] { get }
    var remain: Int { get }
    func deposit(_ money: Int)
    func buy(at index: Int) throws -> (Beverage, Int)
}

class VendingMachine: NSObject, NSSecureCoding {
    private var stocks: Stocks
    private var account: Int = 0
    private var history: [History] = []
    private var dataStateError: DataManageError?
    static var supportsSecureCoding: Bool {
        return true
    }
    var dataState: String? {
        guard let dataStateError = dataStateError else { return nil }
        return "\(dataStateError)"
    }
    static var shared: VendingMachine = {
        do {
            return try DataManager.load()
        } catch {
            let newVendingMachine = VendingMachine(Stocks(WareHouse.generateBeverages(10)))
            newVendingMachine.set(.failToLoad)
            return newVendingMachine
        }
    }()
    
    private init(_ stocks: Stocks) {
        self.stocks = stocks
    }
    
    required init?(coder aDecoder: NSCoder) {
        stocks = aDecoder.decodeObject(forKey: "stocks") as! Stocks
        account = aDecoder.decodeInteger(forKey: "account")
        history = aDecoder.decodeObject(forKey: "history") as! [History]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stocks, forKey: "stocks")
        aCoder.encode(account, forKey: "account")
        aCoder.encode(history, forKey: "history")
    }
    
    // 현재 잔액으로 구매할 수 있는 음료 목록
    func availables(with money: Int) -> [Beverage] {
        return stocks.availables(with: money)
    }
    
    func set(_ dataStateError: DataManageError) {
        self.dataStateError = dataStateError
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
    var userHistory: [History] {
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
        history.append(History(beverage: beverage, date: Date()))
        return (beverage, price)
    }
}
