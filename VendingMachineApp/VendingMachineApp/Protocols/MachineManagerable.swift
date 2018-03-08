//
//  MachineManagerable.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol MachineManagerable {
    func insertBeverage(beverageMenu: BeverageMenu, quantity: Int)
    func deductBeverage(beverageMenu: BeverageMenu, quantity: Int) throws
    func fetchSalesHistory() -> [String]
}
