//
//  Inventory.swift
//  VendingMachine
//
//  Created by 김지나 on 22/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Inventory {
    enum Menu: String {
        case insertMoney = "1"
        case buyBeverage = "2"
    }
    
    var beverageName: String
    var beveragaPrice: Int
    var beverageCount: Int
    
    init(beverageName: String, beveragaPrice: Int, beverageCount: Int) {
        self.beverageName = beverageName
        self.beveragaPrice = beveragaPrice
        self.beverageCount = beverageCount
    }
}

