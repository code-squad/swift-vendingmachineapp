//
//  VendingMachineManagable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/11.
//

import Foundation

protocol VendingMachineManagable {
    func purchaseBeverage(beverageType: Beverage.Type)
    func addBeverage(_ beverageType: Beverage.Type)
    func readBalance() -> Int
    func increaseBalance(_ price: Int)
    func mappingIndexToBeverageType(by index: Int) -> Beverage.Type?
    func mappingIndexToMoneyInput(by index: Int) -> Money.Input?
    func readInventores() -> [ObjectIdentifier : [Beverage]]
    func readInventoryCount(index: Int) -> Int
}
