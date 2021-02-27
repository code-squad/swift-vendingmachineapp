//
//  StockFactory.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/27.
//

import Foundation

protocol StockFactory {
    func checkProductization(of drink: Drink) -> Bool
    func addDrink(_ drink: Drink)
    func availableDrink() -> [Drink]
    func buy(_ drink: Drink, checkCoin: (Drink) -> Drink?) -> Drink?
    func showStock() -> [Drink: UInt]
    func findExpiredDrinks() -> [Drink]
    func findWarmDrinks() -> [Drink]
}
