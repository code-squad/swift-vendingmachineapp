//
//  HistoryOfPurchase.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 11..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

class HistoryOfPurchase {
    private var historyOfPurchase: [Beverage] = []
    
    func add(beverage: Beverage) {
        historyOfPurchase.append(beverage)
    }
}
