//
//  PurchaseHistoryManagable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/03.
//

import Foundation

protocol PurchaseHistoryManagable {
    func addPurchased(_ beverage: Beverage)
    func readHistory() -> [ObjectIdentifier: [Beverage]]
}
