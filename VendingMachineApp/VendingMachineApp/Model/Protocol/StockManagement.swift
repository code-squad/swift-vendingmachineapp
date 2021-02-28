//
//  StockFactory.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/27.
//

import Foundation

protocol StockManagement {
    func checkProductization(of drink: Drink) -> Bool
    func addedDrink(_ drink: Drink)
    func availableForDrinks(coin: Int) -> [Drink]
    func purchased(_ drink: Drink, checkCoin: (Drink) -> Drink?) -> Drink?
    func toShowStock() -> [Drink: UInt]
    func lookingForExpiredDrinks() -> [Drink]
    func lookingForWarmDrinks() -> [Drink]
}
