//
//  StockManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

typealias BeverageType = ObjectIdentifier

class StockManager: StockManagable {
    private var stock: [BeverageType:Stock]
    
    init(_ stock: [BeverageType:Stock]) {
        self.stock = stock
    }
    
    init() {
        self.stock = [BeverageType:Stock]()
    }
    
    var allStock: [Stock] {
        return self.stock.values.filter { $0.count != 0 }
    }
    
    func addStock(_ beverage: Beverage) {
        let beverageType = BeverageType(type(of: beverage))
        if let stock = self.stock[beverageType] {
            stock.add(beverage)
        } else {
            self.stock[beverageType] = Stock([beverage])
        }
    }
}

extension StockManager: Equatable {
    static func == (lhs: StockManager, rhs: StockManager) -> Bool {
        return lhs.stock == rhs.stock
    }
}

class Stock {
    private var beverages: [Beverage]
    
    init(_ beverages: [Beverage]) {
        self.beverages = beverages
    }
    
    convenience init() {
        self.init([Beverage]())
    }
    
    var count: Int {
        return self.beverages.count
    }
    
    var beverageName: String {
        return self.beverages.last?.description ?? ""
    }
    
    func add(_ beverage: Beverage) {
        self.beverages.append(beverage)
    }
}

extension Stock: Equatable {
    static func == (lhs: Stock, rhs: Stock) -> Bool {
        return lhs.beverages == rhs.beverages
    }
}

extension Stock: Sequence {
    func makeIterator() -> StockIterator {
        return StockIterator(self.beverages)
    }
}

class StockIterator: IteratorProtocol {
    private var beverages: [Beverage]
    private var index: Int
    
    init(_ beverages: [Beverage]) {
        self.beverages = beverages
        index = self.beverages.startIndex
    }
    
    func next() -> Beverage? {
        if index < self.beverages.endIndex {
            defer { index = self.beverages.index(after: index) }
            return self.beverages[index]
        } else {
            return nil
        }
    }
}
