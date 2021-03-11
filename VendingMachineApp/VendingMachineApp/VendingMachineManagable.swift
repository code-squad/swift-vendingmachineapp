//
//  VendingMachineManagable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/11.
//

import Foundation

protocol VendingMachineManagable {
    func purchaseBeverage(beverage: Beverage)
    func addBeverage(_ beverage: Beverage)
    func readBalance() -> Int
    func increaseBalance(_ price: Int)
    func tagToBeverageType(by tag: Int) -> Beverage.Type?
    func tagToMoneyInputType(by tag: Int) -> Money.Input?
    func readInventores() -> [ObjectIdentifier: [Beverage]]
    func readInventoryCount(index: Int, allInventores: [ObjectIdentifier: [Beverage]]) -> Int
}
