//
//  SalesHistory.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 25..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class SalesHistory {
    private var saleDate: [Date]
    private var saleBeverageMenus: [BeverageMenu]
    
    init() {
        self.saleDate = []
        self.saleBeverageMenus = []
    }
    
    func addSalesHistory(date: Date, beverageMenu: BeverageMenu) {
        saleDate.append(date)
        saleBeverageMenus.append(beverageMenu)
    }
    
    func historyOfSales() -> [String] {
        let dateFormatter = DateUtility.formatDate(format: "yyyyMMdd")
        var history: [String] = []
        
        for (index, date) in saleDate.enumerated() {
            history.append(dateFormatter.string(from: date) + " -> "
                + saleBeverageMenus[index].makeInstance().description)
        }
        
        return history
    }
}
