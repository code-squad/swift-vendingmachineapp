//
//  StockFactory.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/27.
//

import Foundation

protocol StockManageable {
    func addedDrink(_ drink: Drink)
    func availableForDrinks(coin: Int) -> Set<Drink>
    func purchased(drinkType: Drink.Type, insertedCoin: Int) -> Drink?
    func showedStock() -> [ObjectIdentifier: [Drink]]
    func lookingForExpiredDrinks() -> [Drink]
    func lookingForWarmDrinks() -> [Drink]
}
