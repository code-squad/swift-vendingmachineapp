//
//  PurchaseHistoryManagable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/03.
//

import Foundation

protocol PurchaseHistoryManagable {
    func addPurchased(_ beverageType: Beverage.Type)
    func readHistory() -> [ObjectIdentifier: [Beverage]]
    func readPurchased() -> InventoryManagable
    func forEachPurchased(handler: (Beverage) -> ())
}
