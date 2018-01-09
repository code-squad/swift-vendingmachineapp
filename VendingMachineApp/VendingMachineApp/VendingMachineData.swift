//
//  VendingMachineData.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 18..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class VendingMachineData: NSObject, NSCoding {
    private (set) var stock = [Beverage]()
    private (set) var sortedStockList = [Beverage: Int]()
    private (set) var balance: Int = 0
    static var sharedInstance: VendingMachineData = {
        return VendingMachineData()
    }()

    init(stock: [Beverage]) {
        super.init()
        self.stock = stock
        self.balance = 0
        for item in stock {
            self.makeBeverageList(item)
        }
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
        self.stock = stock
        for item in stock {
            self.makeBeverageList(item)
        }
        self.balance = aDecoder.decodeInteger(forKey: "balance")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.stock, forKey: "stock")
        aCoder.encode(self.balance, forKey: "balance")
    }
    
    init(stock: [Beverage], stockList: [Beverage: Int], balance: Int) {
        self.stock = stock
        self.sortedStockList = stockList
        self.balance = balance
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
    
    func addBeverage(item: Beverage) {
        stock.append(item)
        makeBeverageList(item)
        NotificationCenter.default.post(name: .labelNC,
                                        object: self,
                                        userInfo: ["beverage": item])
    }
    
    private func makeBeverageList(_ item: Beverage) {
        if let stockListNumber = sortedStockList[item] {
            sortedStockList[item] = stockListNumber + 1
        } else {
            sortedStockList[item] = 1
        }
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
extension VendingMachineData: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        let newBeverage = Beverage()
        return newBeverage
    }
}
