//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/25.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Beverages: NSObject, NSCoding {
    private(set) var beverages: [Beverage]
    let bevergaesKey = "beverages"
    
    override init() {
        beverages = []
    }
    
    required init?(coder: NSCoder) {
        guard let beverages = coder.decodeObject(forKey: bevergaesKey) as? [Beverage] else {
            self.beverages = []; return
        }
        self.beverages = beverages
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(beverages, forKey: bevergaesKey)
    }
    
    func dequeue() -> Beverage {
        return beverages.removeFirst()
    }
    
    func enqueue(beverage: Beverage) {
        beverages.append(beverage)
    }
}
