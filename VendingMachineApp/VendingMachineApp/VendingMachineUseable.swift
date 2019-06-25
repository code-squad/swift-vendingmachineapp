//
//  VendingMachineUseable.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/25/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol VendingMachineUseable {
    mutating func insertCoin(_ coin: Int)
    func getBuyableDrinkList () -> [Drink]
    mutating func buy (_ drink: Drink) throws
    func getBalance () -> Money
    func getStockList () -> Dictionary<Drink, Int>
    func getSellList () -> [Drink]
}
