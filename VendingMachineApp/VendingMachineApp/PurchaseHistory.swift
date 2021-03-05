//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/04.
//

import Foundation

class PurchaseHistory {
    private var orderList: [Order]
    var orderCount: Int {
        orderList.count
    }
    
    init(orderList: [Order]) {
        self.orderList = orderList
    }
    
    convenience init() {
        self.init(orderList: [])
    }
    
    func add(_ order: Order) {
        orderList.append(order)
    }
}
