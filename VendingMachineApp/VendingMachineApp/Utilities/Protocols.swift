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
typealias Purchased = Int
typealias Argument = Int

protocol Product {
    associatedtype MenuType: EnumCollection, Purchasable
    var menuType: MenuType { get }
    func isExpired(with date: Date) -> Bool
    func isLowCalorie() -> Bool
    var productName: String { get }
    var price: Int { get }
}

protocol Machine: Sequence {
    associatedtype MenuType: EnumCollection, Purchasable
    associatedtype ProductType: Product
    func checkTheStock() -> [MenuType:Stock]
}

protocol Managable: Machine {
    func fullSupply(_ count: Int)

    func supply(productType: MenuType, _ addCount: Stock)

    func remove(productType: MenuType, _ addCount: Stock)

    func showPurchasedList() -> [HistoryInfo]
}

protocol UserServable: Machine {

    func popProduct(_ menu: MenuType) -> ProductType?

    func insertMoney<MachineType>(_ money: MoneyManager<MachineType>.Unit)

    func showBalance() -> Balance

    func showAffordableProducts() -> [MenuType]

    func showExpiredProducts(on day: Date) -> [MenuType:Stock]

    func showHotProducts() -> [MenuType]
}

protocol ActivateMode {
    func prompt() -> [Argument]?
    func perform(_ arguments: [Argument]) -> String?
}

extension ActivateMode {
    // 사용자 입력 문자열을 2개의 인자로 분리 및 숫자 변환.
    func splitUserInput() -> [Int] {
        guard let userInput = readLine(), userInput != "q" || userInput != "quit" else { return [] }
        return userInput.split(separator: " ").flatMap { Int($0) }
    }

}

protocol Purchasable {
    var price: Int { get }

    var productName: String { get }
}
