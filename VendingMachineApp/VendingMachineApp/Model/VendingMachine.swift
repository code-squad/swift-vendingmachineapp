//
//  VendingMachineData.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 18..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

protocol AdminAble {
    func addBeverage(_ item: Beverage)
    func getUserBuyHistory() -> [Beverage: Int]
}

protocol UserAble {
    func insertMoney(_ money: Int)
    func vendingMachineBalance() -> Int
    func vendingMachineReceipt() -> [Beverage]
    func buyBeverage(_ selectedValue: Beverage) throws
}

class VendingMachine: NSObject, NSCoding, UserAble, AdminAble {
    private var stock = [Beverage]()
    private (set) var receipt = [Beverage]()
    private (set) var sortedStockList = [Beverage: Int]()
    private var userBuyHistory = [Beverage: Int]()
    private var balance: Int = 0
    private (set) static var sharedInstance: VendingMachine = {
        return VendingMachine()
    }()
    
    static func load(instance: VendingMachine) {
        self.sharedInstance = instance
    }

    init(stock: [Beverage]) {
        super.init()
        self.stock = stock
        self.balance = 0
        self.sortedStockList = stock.toDictionary()
    }
    
    private convenience override init() {
        self.init(stock: [])
    }
    
    convenience init(stock: [Beverage], stockList: [Beverage: Int]) {
        self.init(stock: stock, stockList: stockList, balance: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        guard let stock = aDecoder.decodeObject(forKey: "stock") as? [Beverage] else { return }
        guard let receipt = aDecoder.decodeObject(forKey: "receipt") as? [Beverage] else { return }
        self.stock = stock
        self.sortedStockList = stock.toDictionary()
        self.userBuyHistory = receipt.toDictionary()
        self.receipt = receipt
        self.balance = aDecoder.decodeInteger(forKey: "balance")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.stock, forKey: "stock")
        aCoder.encode(self.balance, forKey: "balance")
        aCoder.encode(self.receipt, forKey: "receipt")
    }
    
    init(stock: [Beverage], stockList: [Beverage: Int], balance: Int) {
        self.stock = stock
        self.sortedStockList = stockList
        self.balance = balance
    }
    
    func buyBeverage(_ selectedValue: Beverage) throws {
        guard let item = stock.index(where: { $0.name == selectedValue.name }) else {
            throw ErrorCode.noStock
        }
        guard selectedValue.checkAvailableList(with: balance) else {
            throw ErrorCode.noMoney
        }
        sortedStockList[selectedValue]! -= 1
        balance -= selectedValue.price
        receipt.append(selectedValue)
        userBuyHistory = receipt.toDictionary()
        NotificationCenter.default.post(name: .labelNC,
                                        object: self,
                                        userInfo: ["beverage": stock.remove(at: item)])
        NotificationCenter.default.post(name: .recepitNC,
                                        object: self,
                                        userInfo: ["beverage": selectedValue])
    }
    
    func addBeverage(_ item: Beverage) {
        stock.append(item)
        sortedStockList = stock.toDictionary()
        NotificationCenter.default.post(name: .labelNC,
                                        object: self,
                                        userInfo: ["beverage": item])
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
    
    func insertMoney(_ money: Int) {
        self.balance += money
    }
    
    func vendingMachineBalance() -> Int {
        return self.balance
    }
    
    func vendingMachineReceipt() -> [Beverage] {
        return self.receipt
    }
    
    func getUserBuyHistory() -> [Beverage: Int] {
        return self.userBuyHistory
    }
}

extension VendingMachine: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        let newBeverage = Beverage()
        return newBeverage
    }
}

extension Array where Element: Beverage {
    func toDictionary() -> [Element: Int] {
        var dict = [Element: Int]()
        for key in self {
            if let listNum = dict[key] {
                dict[key] = listNum + 1
            } else {
                dict[key] = 1
            }
        }
        return dict
    }
}
