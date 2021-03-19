//
//  VendingMachined.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation

protocol VendingMachined {
    func showBeverageStock(drinkType : Beverage.Type) -> Int
}

protocol UserModable : VendingMachined {
    func putPayMoney(money: Int)
    func checkCurrentBalance() -> Int
    func purchaseBeverage(beverageType : Beverage.Type)
    func purchaseHistory() -> [Beverage]
}

protocol AdminModable : VendingMachined {
    func addStock(_ beverage : Beverage)
}
