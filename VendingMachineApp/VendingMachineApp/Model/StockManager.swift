//
//  StockManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

typealias BeverageType = ObjectIdentifier

class StockManager: Codable {
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
    
    func readStock(_ beverageType: BeverageType) -> Int {
        return self.stock[beverageType]?.count ?? 0
    }
    
    enum CodingKeys: String, CodingKey {
        case stocks = "stocks"
    }
    
    // Encodable
    func encode(to encoder: Encoder) throws {
        var stocks = [Stock]()
        self.stock.values.forEach { stocks.append($0) }
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(stocks, forKey: .stocks)
    }
    
    // Decodable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let stocks = try container.decode([Stock].self, forKey: .stocks)
        let tempStock = stocks.reduce(into: [BeverageType:Stock](), {
            $0[$1.beverageType] = $1
        })
        self.stock = tempStock
    }
}

extension StockManager: Equatable {
    static func == (lhs: StockManager, rhs: StockManager) -> Bool {
        return lhs.stock == rhs.stock
    }
}

class Stock: IteratorProtocol, Sequence, Codable {
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
    
    var beverageType: BeverageType {
        return BeverageType(type(of: self.beverages.first!))
    }
    
    func add(_ beverage: Beverage) {
        self.beverages.append(beverage)
    }
    
    private var index: Int = 0
    func next() -> Beverage? {
        if index < self.beverages.endIndex {
            defer { index = self.beverages.index(after: index) }
            return self.beverages[index]
        } else {
            self.index = 0
            return nil
        }
    }
}

extension Stock: Equatable {
    static func == (lhs: Stock, rhs: Stock) -> Bool {
        return lhs.beverages == rhs.beverages
    }
}

