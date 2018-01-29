//
//  ManagableProtocol.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 29..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation

typealias Stock = Int

protocol Managable {
    func fullSupply(_ count: Int)

    func supply(_ menu: VendingMachine.Menu, _ count: Stock)

    func remove(_ menu: VendingMachine.Menu, _ count: Stock)

    func purchasedList() -> [HistoryInfo]

    func checkTheStock() -> [VendingMachine.Menu:Stock]

    func purchasedCounts() -> [VendingMachine.Menu:Int]

    var totalPurchasedCount: Int { get }
}
