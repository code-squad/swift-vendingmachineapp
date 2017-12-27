//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 15..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct AdminVendingMachine {
    private var vendingMachineData: VendingMachineData
    init(with vendingMachineData: VendingMachineData) {
        self.vendingMachineData = vendingMachineData
    }
    mutating func addBeverage(_ item: Beverage) {
        vendingMachineData.addBeverage(item)
    }
    mutating func removeBeverage(_ item: Beverage) throws {
       try vendingMachineData.removeBeverage(item)
    }
    func getPassedValidateBeverage() -> [BeverageCheck] {
        let checkingStock = vendingMachineData.stock.flatMap { $0 as? BeverageCheck }
        return checkingStock.filter { !$0.validate(with: Date()) }
    }
}
