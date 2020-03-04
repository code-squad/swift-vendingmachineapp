//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by delma on 03/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Beverages {
    private var beverages: [Beverage]
    
    init() {
        beverages = [Beverage]()
    }
    
    func forEachBeverages(_ handler: (Beverage) -> ()) {
        beverages.forEach { handler($0) }
    }
    
    func addBeverage(_ beverage: Beverage) {
        beverages.append(beverage)
    }
}
