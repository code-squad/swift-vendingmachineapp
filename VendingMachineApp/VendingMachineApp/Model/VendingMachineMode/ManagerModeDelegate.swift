//
//  ManagerModeDelegate.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol ManagerModeDelegate {
    func add(productIndex: Int)
    @discardableResult func delete(productIndex: Int) -> Drink?
    func howMuchIncome() -> Price
    func countOfRemainDrinks() -> [Count]
    func listOfInventory() -> [Drink: Count]
    func listOfOverExpirationDate() -> [Drink]
}
