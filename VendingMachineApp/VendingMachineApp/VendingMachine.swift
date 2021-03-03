//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class VendingMachine {
    
    private let numberOfSlots: Int
    private var inventory: Inventory
    private var moneyDeposited: Int = 0
    
    private var soldItems: [Date : Beverage] = [:]
    
    init(numberOfSlots: Int) {
        self.numberOfSlots = numberOfSlots
        self.inventory = Inventory(numberOfProductTypes: numberOfSlots)
    }
}
