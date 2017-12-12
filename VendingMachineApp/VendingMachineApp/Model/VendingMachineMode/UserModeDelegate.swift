//
//  UserModeDelegate.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol UserModeDelegate {
    func add(money: Int)
    func listOfCanBuy() -> [Drink]
    @discardableResult func buy(productIndex: Int) -> Drink?
    func howMuchRemainMoney() -> Price
    func listOfHotDrink() -> [Drink]
    func listOfPurchase() -> Array<Drink>
    func extractAllMoney() -> Int
}
