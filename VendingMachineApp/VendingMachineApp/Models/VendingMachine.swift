//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class VendingMachine {
    private var stock = [Beverage]()
    
    var stockList: String {
        return "\(stock)"
    }
    
    func fill(beverage: Beverage) {
        stock.append(beverage)
    }
}
