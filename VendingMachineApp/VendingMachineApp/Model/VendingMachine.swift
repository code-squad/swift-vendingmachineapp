//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    private var stock: Stock
    private var money: Money {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MoneyChanged"), object: self, userInfo: ["balance":"\(money)"])
        }
    }
    private(set) var purchaseHistory = [Beverage]()
    var purchasableList: [Beverage] {
        stock.getPurchasableList(money: money)
    }
    var stockList: [(key: Beverage, value: Int)] {
        stock.sortOut().sorted {
            $0.key < $1.key
        }
    }
    var dateExpiredBeverages: [Beverage] {
        stock.getDateExpiredBeverages()
    }
    var hotBeverages: [Beverage] {
        stock.getHotBeverages()
    }
    
    override init() {
        self.stock = Stock()
        self.money = Money()
    }
    
    func addBeverage(beverage: Beverage) {
        stock.add(beverage: beverage)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "StockChanged"), object: self, userInfo: ["stock":stockList])
    }
    
    func checkBalance() -> Money {
        return money
    }
    
    func addBalance(_ money: Money) {
        self.money += money
    }
    
    func buy(beverage: Beverage) -> Beverage? {
        guard purchasableList.contains(beverage) else {
            return nil
        }
        let servedBeverage = stock.serve(beverage: beverage)
        money -= servedBeverage.price
        purchaseHistory.append(servedBeverage)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "StockChanged"), object: self, userInfo: ["stock":stockList])
        return beverage
    }
    
    // MARK: - NSCoding
    
    required init?(coder: NSCoder) {
        guard let stock = coder.decodeObject(forKey: "stock") as? Stock,
            let money = coder.decodeObject(forKey: "money") as? Money else { return nil }
        self.stock = stock
        self.money = money
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(stock, forKey: "stock")
        coder.encode(money, forKey: "money")
    }
}
