//
//  Protocols.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias Stock = Int
typealias Balance = Int

protocol Managable {
    func fullSupply(_ count: Int)

    func supply(_ menu: VendingMachine.Menu, _ count: Stock)

    func remove(_ menu: VendingMachine.Menu, _ count: Stock)

    func purchasedList() -> [HistoryInfo]

    func checkTheStock() -> [VendingMachine.Menu:Stock]
}

protocol UserServable {
    func popProduct(_ menu: VendingMachine.Menu) -> Beverage?

    func insertMoney(_ money: MoneyManager.Unit)

    func showBalance() -> Balance

    func affordableProducts() -> [VendingMachine.Menu]

    func expiredProducts(on day: Date) -> [VendingMachine.Menu:Stock]

    func hotProducts() -> [VendingMachine.Menu]

    func checkTheStock() -> [VendingMachine.Menu:Stock]
}

// EnumCollection을 채택한 타입은 Hashable도 구현해야 함. Enum은 이미 Hashable이므로 hashValue를 따로 구현해줄 필요 없음.
protocol EnumCollection: Hashable {
    // sequence를 array로 타입캐스팅하여 반환.
    static var allValues: [Self] { get }
    static func getCase(rawValue: Int) -> VendingMachine.Menu?
}
