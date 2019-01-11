//
//  HistoryOfPurchase.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 11..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

class HistoryOfPurchase: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(<#T##object: Any?##Any?#>, forKey: <#T##String#>)
    }
    
    required init?(coder aDecoder: NSCoder) {
        <#code#>
    }
    
    private var historyOfPurchase: [Beverage] = []
    
    func add(beverage: Beverage) {
        historyOfPurchase.append(beverage)
    }
}
