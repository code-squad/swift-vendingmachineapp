//
//  VendingProtocol.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 19..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import Foundation

protocol Vending {
    static func sharedInstance() -> VendingMachine
    static func storedInstance(_ vendingMachine: VendingMachine)
    func choiceBeverageData(menuType: InventoryBox.InventoryMenu) -> Beverage
    func addInInventory(beverageName: Beverage, number: Int)
    func beverageNumberOf(menuType: InventoryBox.InventoryMenu) -> Int
    func typeSelector(tag: Int) -> InventoryBox.InventoryMenu
    func buyBeverage(beverageName: Beverage)
    func showPurchaseProductHistory() -> [PurchaseProduct]
    func putCoins(coins: Int)
    func checkBalance () -> Int
}
