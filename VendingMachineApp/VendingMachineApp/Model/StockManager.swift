//
//  StockManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

typealias BeverageType = ObjectIdentifier

class StockManager {
    private var stock: [BeverageType:Stock]
    
    init(_ stock: [BeverageType:Stock]) {
        self.stock = stock
    }
    
    init() {
        self.stock = [BeverageType:Stock]()
    }
}

extension StockManager: Equatable {
    static func == (lhs: StockManager, rhs: StockManager) -> Bool {
        return lhs.stock == rhs.stock
    }
}
