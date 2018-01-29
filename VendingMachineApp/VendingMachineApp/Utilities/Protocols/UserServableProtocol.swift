//
//  Protocols.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias Balance = Int

protocol UserServable {
    func popProduct(_ menu: VendingMachine.Menu) -> Beverage?

    func insertMoney(_ money: MoneyManager.Unit)

    func showBalance() -> Balance

    func affordableProducts() -> [VendingMachine.Menu]

    func expiredProducts(on day: Date) -> [VendingMachine.Menu:Stock]

    func hotProducts() -> [VendingMachine.Menu]

    func checkTheStock() -> [VendingMachine.Menu:Stock]
}
