//
//  InventoryManagable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/03.
//

import Foundation

protocol InventoryManagable {
    func expiredBeverages(current: Date) -> Inventory
    func hotBeverages() -> Inventory
    func readInventores() -> [Beverage: Int]
    func addInventory(_ beverage: Beverage)
    func removeInventory(_ beverage: Beverage) -> Beverage?
    func fotEachBeverage(handler: (Beverage) -> ())
    func isPurchasableInventory(balance: Int) -> Inventory
}
