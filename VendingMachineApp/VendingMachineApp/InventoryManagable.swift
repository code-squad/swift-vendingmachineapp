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
    func readInventores() -> [ObjectIdentifier: [Beverage]]
    func addInventory(_ beverage: Beverage)
    func removeInventory(_ beverage: Beverage) -> Beverage?
    func fotEachBeverage(handler: (Beverage) -> ())
    func isPurchasableInventory(balance: Int) -> InventoryManagable
    func tagToBeverageType(by tag: Int) -> Beverage.Type?
    func readInventory(index: Int, allInventores: [ObjectIdentifier: [Beverage]]) -> Int
}
