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
        aCoder.encode(historyOfPurchase, forKey: HistoryOfPurchaseArchiveKey.historyOfPurchase)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        historyOfPurchase = aDecoder.decodeObject(forKey: HistoryOfPurchaseArchiveKey.historyOfPurchase) as! [Beverage]
    }
    
    private var historyOfPurchase: [Beverage] = []
    
    func add(beverage: Beverage) {
        historyOfPurchase.append(beverage)
    }
}
