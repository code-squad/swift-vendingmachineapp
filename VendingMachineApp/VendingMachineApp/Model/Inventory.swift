//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/06.
//

import Foundation

class Inventory : NSObject, NSCoding {
    private var stocks: [Beverage]
    
    
    override init() {
        self.stocks = [Beverage]()
    }
    
    required init?(coder decoder: NSCoder) {
        stocks = decoder.decodeObject(forKey: "stocks") as! [Beverage]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(stocks, forKey: "stocks")
    }
    
    public static func == (lhs: Inventory, rhs: Inventory) -> Bool{
        return lhs.stocks == rhs.stocks
    }
    
    
    //MARK:- method
    
    func append(with item: Beverage) {
        stocks.append(item)
    }
    
    func remove(item: Beverage.Type) -> Beverage? {
        for (i, drink) in stocks.enumerated() {
            if ObjectIdentifier(item) == ObjectIdentifier(type(of: drink)) {
                return stocks.remove(at: i)
            }
        }
        return nil
    }
    
    func getStockList() -> [ObjectIdentifier : Int] {
        let abstractStocks = stocks.map{ObjectIdentifier(type(of: $0))}
        let list = abstractStocks.toDictionary{ $0 }
        return list.mapValues{ $0.count }
    }
    
    func expiredItems() -> [Beverage] {
        let expired = stocks.filter{$0.isExpired(current: Date())}
        return expired
    }
    
    func lowCaffeineItems() -> [Beverage] {
        var lowCaffeine = [Beverage]()
        
        stocks.forEach { item in
            if let coffee = item as? Coffee {
                if coffee.isLowCaffeine(criteria: 90) { lowCaffeine.append(coffee) }
            }
        }
        return lowCaffeine
    }
    
    func cheapItems(with money: Int) -> [Beverage] {
        let cheap = stocks.filter{ $0.price <= money }
        return cheap
    }
    
}
