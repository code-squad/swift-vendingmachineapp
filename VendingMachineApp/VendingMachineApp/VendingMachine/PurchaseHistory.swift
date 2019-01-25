//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class PurchaseHistory: NSObject, NSCoding {
    
    private var history: [Beverage]
    
    override init() {
        history = []
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.history = aDecoder.decodeObject(forKey: "history") as? [Beverage] ?? []
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(history, forKey: "history")
    }
    
    func addHistory(of drink: Beverage) {
        history.append(drink)
    }
    
    func get() -> [Beverage] {
        return history
    }
}
