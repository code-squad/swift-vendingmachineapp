//
//  VendingMachined.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation

protocol VendingMachined {
    func addStock(buttonIndex: Int)
    func putPayMoney(buttonIndex: Int)
    func checkCurrentBalance() -> Int
    func showAllBeverageStock(handler : (Int, Int) -> Void)
    func showDrinkMenuList() -> [Beverage]
}
