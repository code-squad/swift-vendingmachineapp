//
//  VendingMachineManagement.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/20/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol VendingMachineManagementable: StockPrintable, pieGraphDrawable {
    mutating func supply(_ drinkMenu: DrinkMenu, amount: Int)
    func getExpiredDrinkList () -> [Drink]
    func getHotDrinkList () -> [Drink]
}
