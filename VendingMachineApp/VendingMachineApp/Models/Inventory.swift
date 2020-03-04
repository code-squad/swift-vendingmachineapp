//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/04.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Inventory: CustomStringConvertible {
    private var inventory = [Beverage]()
    
    var description: String {
        return inventory.description
    }
    
    func add(_ beverage: Beverage) {
        inventory.append(beverage)
    }
}
