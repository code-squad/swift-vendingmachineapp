//
//  History.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

class History {
    private var beverages = [Beverage]()
    
    public func add(with beverage: Beverage) {
        self.beverages.append(beverage)
    }
    
    public func list() -> [Beverage] {
        return self.beverages
    }
}
