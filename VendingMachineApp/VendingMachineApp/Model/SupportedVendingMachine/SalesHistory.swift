//
//  SalesHistory.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 25..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

final class SalesHistory {
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

extension SalesHistory: Codable {
    private enum CodingKeys: CodingKey {
        case saleDate, saleBeverageMenus
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.saleDate = try values.decode([Date].self, forKey: .saleDate)
        self.saleBeverageMenus = try values.decode([BeverageMenu].self, forKey: .saleBeverageMenus)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(saleDate, forKey: .saleDate)
        try container.encode(saleBeverageMenus, forKey: .saleBeverageMenus)
    }
}
