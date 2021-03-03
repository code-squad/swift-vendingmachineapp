//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class Inventory {
    private let numberOfProductTypes: Int
    private let slots: [Slot]
    
    init(numberOfProductTypes: Int) {
        self.numberOfProductTypes = numberOfProductTypes
        self.slots = (0..<numberOfProductTypes).map { _ in Slot() }
    }
}
