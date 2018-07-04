//  StockManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

typealias BeverageType = ObjectIdentifier

class StockManager: NSObject, NSSecureCoding {
    private var stock: [BeverageType:Stock]
    
    init(_ stock: [BeverageType:Stock]) {
        self.stock = stock
    }
    
    override init() {
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
    
    // MARK: NSSecureCoding
    private struct NSCoderKeys {
        static let allStock = "allStock"
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(allStock, forKey: NSCoderKeys.allStock)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let allStock = aDecoder.decodeObject(forKey: NSCoderKeys.allStock) as? [Stock] else {
            return nil
        }
        self.stock = allStock.reduce(into: [BeverageType:Stock]()){
            $0[$1.beverageType] = $1
        }
    }
}

class Stock: NSObject, IteratorProtocol, Sequence, NSSecureCoding {
    private var beverages: [Beverage]
    
    init(_ beverages: [Beverage]) {
        self.beverages = beverages
    }
    
    override init() {
        self.beverages = [Beverage]()
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
    
    override func isEqual(_ object: Any?) -> Bool {
        if let beverages = object as? [Beverage] {
            return beverages == self.beverages
        } else {
            return false
        }
    }
    
    // MARK: NSSecureCoding
    private struct NSCoderKeys {
        static let beveragesKey = "beverages"
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(beverages, forKey: NSCoderKeys.beveragesKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let decoded = aDecoder.decodeObject(of: NSArray.self, forKey: NSCoderKeys.beveragesKey),
            let beverages = decoded as? [Beverage] else {
                return nil
        }
        self.beverages = beverages
        super.init()
    }
}
