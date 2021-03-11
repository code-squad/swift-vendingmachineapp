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
    func addBeverage(_ beverage: Beverage)
    func removeBeverage(_ beverage: Beverage) -> Beverage?
    func fotEachBeverage(handler: (Beverage) -> ())
    func isPurchasableInventory(balance: Int) -> InventoryManagable
    func tagToBeverageType(by tag: Int) -> Beverage.Type?
    func readInventoryCount(index: Int, allInventores: [ObjectIdentifier: [Beverage]]) -> Int
}
