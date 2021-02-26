//
//  SalesLog.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class SalesLog {
    private var log: Drinks
    
    init() {
        log = Drinks()
    }
    
    func add(_ drink: Drink) {
        log.append(drink)
    }
    
    func get() -> [String] {
        return log.getList()
    }
}
