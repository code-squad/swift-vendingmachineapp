//
//  Stock.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol Stockable {
    func add(beverage: Beverage)
    func subtract(beverage: Beverage) -> Bool
    func logSaled(beverage: Beverage)
    func repeatBeverages(handler: (Beverage) -> (Void))
    func repeatSalesLog(handler: (Beverage) -> (Void))
}

final class Stock: Stockable {
    enum Notification {
        static let beveragesDidChange = Foundation.Notification.Name("beveragesDidChange")
    }
    
    private var beverages: [Beverage]
    private var salesLog = [Beverage]()
    
    init(beverages: [Beverage] = []) {
        self.beverages = beverages
    }
    
    func add(beverage: Beverage) {
        beverages.append(beverage)
        post(beverage: beverage)
    }
    
    func subtract(beverage: Beverage) -> Bool {
        for index in 0 ..< beverages.count {
            if beverages[index] == beverage {
                beverages.remove(at: index)
                post(beverage: beverage)
                return true
            }
        }
        return false
    }
    
    private func post(beverage: Beverage) {
        NotificationCenter.default.post(
            name: Notification.beveragesDidChange,
            object: self,
            userInfo: ["beverage": beverage]
        )
    }
    
    func logSaled(beverage: Beverage) {
        salesLog.append(beverage)
    }
    
    func repeatBeverages(handler: (Beverage) -> ()) {
        beverages.forEach { handler($0) }
    }
    
    func repeatSalesLog(handler: (Beverage) -> (Void)) {
        salesLog.forEach { handler($0) }
    }
}
