//
//  MoneyManager.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class MoneyManager<MachineType: Machine> {
    // 현재 잔액
    private(set) var balance: Balance {
        didSet {
            NotificationCenter.default.post(
                name: NSNotification.Name(NotificationNames.didUpdateBalance.description),
                object: nil)
        }
    }
    init() {
        self.balance = 0
    }

    // 삽입 가능한 돈 단위.
    enum Unit: Balance {
        case oneHundred = 100
        case fiveHundred = 500
        case oneThousand = 1000
    }

    // 잔액 차감.
    func updateBalance<ProductType: Product>(_ recentChanged: ProductType, isPurchased: Bool) {
        if isPurchased {
            // 현재 잔액에서 빼먹은 음료수의 가격만큼을 차감.
            balance -= recentChanged.price
        }
    }

    // 잔액 충전.
    func insert(money: Unit) {
        balance += money.rawValue
    }

    // 현재 잔액으로 구입가능한 음료수 리스트 반환.
    func showAffordableList(from sellingList: [MachineType.MenuType]) -> [MachineType.MenuType] {
        // 품절이 아닌 음료수 중에서 가격이 잔액보다 같거나 작은 메뉴만 반환.
        return sellingList.filter { balance >= $0.price }
    }

}
