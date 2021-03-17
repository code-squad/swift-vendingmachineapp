//
//  SalesLog.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class SalesLog: NSObject, NSCoding {
    
    private var log: BeverageInventory
    
    override init() {
        log = BeverageInventory()
    }
    
    func update(_ drink: Beverage) {
        log.append(drink)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(log, forKey: "log")
    }
    
    required init?(coder: NSCoder) {
        self.log = coder.decodeObject(forKey: "log") as! BeverageInventory
    }
//    func get() -> [String] {
//        return log.getList()
//    }
}
