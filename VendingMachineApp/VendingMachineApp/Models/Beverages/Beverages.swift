//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/25.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Beverages {
    private(set) var beverages: [Beverage] = []
    
    func dequeue() -> Beverage {
        return beverages.removeFirst()
    }
    
    func enqueue(beverage: Beverage) {
        beverages.append(beverage)
    }
}
