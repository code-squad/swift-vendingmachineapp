//
//  PurchaseProductHistory.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class PurchaseProductHistory: NSObject, NSCoding {
    private var purchaseDate: [Date]
    private var purchaseBeverage: [String]
    override init() {
        purchaseDate = [Date]()
        purchaseBeverage = [String]()
    }
    required init?(coder aDecoder: NSCoder) {
        purchaseDate = aDecoder.decodeObject(forKey: "purchaseDate") as? [Date] ?? [Date()]
        purchaseBeverage = (aDecoder.decodeObject(forKey: "purchaseBeverage") as? [String]) ?? [""]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(purchaseDate, forKey: "purchaseDate")
        aCoder.encode(purchaseBeverage, forKey: "purchaseBeverage")
    }
    
    func recordOfPurchaseHistory(date: Date, beverage: String) {
        purchaseDate.append(date)
        purchaseBeverage.append(beverage)
    }
    
    func historyOfPurchase() -> [String] {
        var history = [String]()
        for (index, date) in purchaseDate.enumerated() {
            history.append(String(describing: date)+purchaseBeverage[index])
        }
        return history
    }
}
