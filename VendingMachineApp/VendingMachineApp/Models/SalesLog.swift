//
//  SalesLog.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class SalesLog {
    private var log: BeverageInventory
    
    init() {
        log = BeverageInventory()
    }
    
    func update(_ drink: Beverage) {
        log.append(drink)
    }
    
//    func get() -> [String] {
//        return log.getList()
//    }
}
