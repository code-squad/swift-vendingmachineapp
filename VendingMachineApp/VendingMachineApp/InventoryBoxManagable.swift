//
//  InventoryBoxManagable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/15.
//

import Foundation

protocol InventoryBoxManagable {
    func mappingIndexToBeverageType(by index: Int) -> Beverage.Type?
    func mappingIndexToMoneyInput(by index: Int) -> Money.Input?
    func readInventoryCount(beverageType: Beverage.Type) -> Int
    func readInventores(inventory: InventoryManagable) -> [ObjectIdentifier: [Beverage]]
    func removeBeverage(beverageType: Beverage.Type) -> Beverage?
}
