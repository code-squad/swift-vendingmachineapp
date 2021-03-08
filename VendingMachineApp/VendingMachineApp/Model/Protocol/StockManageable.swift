//
//  StockFactory.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/27.
//

import Foundation

protocol StockManageable {
    func checkProductization(of drink: Drink) -> Bool
    func addedDrink(_ drink: Drink)
    func availableForDrinks(coin: Int) -> [Drink]
    func purchased(drinkType: Drink.Type, insertedCoin: Int) -> Drink?
    func toShowStock() -> [ObjectIdentifier: [Drink]]
    func lookingForExpiredDrinks() -> [Drink]
    func lookingForWarmDrinks() -> [Drink]
}
