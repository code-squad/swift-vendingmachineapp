//
//  MoneyManagable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/02.
//

import Foundation

protocol MoneyManagable {
    func readBalance() -> Int
    func increaseBalance(_ moneyInputType: Money.Input)
    func decreaseBalance(_ price: Int)
}
