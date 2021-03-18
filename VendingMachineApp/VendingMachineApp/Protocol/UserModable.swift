//
//  VendingMachined.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation

protocol UserModable {
    func addStock(_ beverage : Beverage)
    func putPayMoney(money: Int)
    func checkCurrentBalance() -> Int
    func showBeverageStock(drinkType : Beverage.Type) -> Int
    func purchaseBeverage(beverageType : Beverage.Type)
    func purchaseHistory() -> [Beverage]
}
