//
//  StockPrintable.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 7/3/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

protocol StockPrintable {
    func printStock () -> [Int]
}

protocol BalancePrintable {
    func printBalance () -> Money
}

protocol SellListPrintable {
    func printSellList(handler: ([Drink])->())
}
