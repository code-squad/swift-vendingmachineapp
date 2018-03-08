//
//  PurchaseProductHistory.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class PurchaseProductHistory {
    private var purchaseDate: [Date]
    private var purchaseBeverage: [String]
    init() {
        purchaseDate = [Date]()
        purchaseBeverage = [String]()
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
