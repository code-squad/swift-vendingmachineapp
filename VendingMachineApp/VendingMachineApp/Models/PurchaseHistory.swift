//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/04.
//

import Foundation

class PurchaseHistory: NSObject, NSCoding {
    private var orderList: [Order]
    var orderCount: Int {
        orderList.count
    }
    
    init(orderList: [Order]) {
        self.orderList = orderList
    }
    
    convenience override init() {
        self.init(orderList: [])
    }
    
    struct PropertyKey {
        static let orderListKey = "orderList"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(orderList, forKey: PropertyKey.orderListKey)
    }
    
    required init?(coder: NSCoder) {
        self.orderList = coder.decodeObject(forKey: PropertyKey.orderListKey) as? [Order] ?? []
    }
    
    func add(_ order: Order) {
        orderList.append(order)
    }
}
