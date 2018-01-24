//
//  AdminVendingMachine.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 15..
//  Copyright © 2018년 Napster. All rights reserved.
//

import Foundation

class AdminVendingMachine: AdminAbleSetData, AdminAbleGetData, PieGraphDataSource {
    private var vendingMachine: AdminAbleSetData & AdminAbleGetData
    
    init(_ machine: AdminAbleSetData & AdminAbleGetData) {
        self.vendingMachine = machine
    }
    
    func addBeverage(_ item: Beverage) {
        vendingMachine.addBeverage(item)
    }
    
    func getUserBuyHistory() -> [Beverage: Int] {
       return vendingMachine.getUserBuyHistory()
    }
}
