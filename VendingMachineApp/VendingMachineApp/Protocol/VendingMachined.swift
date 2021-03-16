//
//  VendingMachined.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation

protocol VendingMachined {
    func addStock(buttonIndex: Int)
    func putPayMoney(money: Int)
    func checkCurrentBalance() -> Int
    func showBeverageStock(drinkType : Beverage.Type) -> Int
}
