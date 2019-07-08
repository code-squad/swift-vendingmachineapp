//
//  VendingMachineUseable.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/25/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol VendingMachineUseable: StockPrintable, BalancePrintable, SellDrinkPrintable {
    mutating func insertCoin(_ coin: Int)
    func getBuyableDrinkList () -> [Drink]
    mutating func buy (_ drink: Drink) throws
    func buyToDrinkMenu (_ drinkMenu: DrinkMenu) throws
}
