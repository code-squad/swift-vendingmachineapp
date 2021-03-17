//
//  InventoryManagable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/03.
//

import Foundation

protocol InventoryManagable {
    func expiredBeverages(current: Date) -> InventoryManagable
    func hotBeverages() -> InventoryManagable
    func addBeverage(_ beverageType: Beverage.Type)
    func forEachBeverage(handler: (Beverage) -> ())
    func isPurchasableInventory(balance: Int) -> InventoryManagable
    func readInventoryCount(beverageType: Beverage.Type) -> Int
    func readInventores() -> [ObjectIdentifier : [Beverage]]
    func removeBeverageInInventoryBox(beverageType: Beverage.Type) -> Beverage?
    func isPurchasableBeverage(balance: Int, beverageType: Beverage.Type) -> Bool
}
