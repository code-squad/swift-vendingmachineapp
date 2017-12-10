//
//  User.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct User: EnableMode {
    private var delegate: UserModeDelegate

    init(target: UserModeDelegate) {
        delegate = target
    }

    func makeMenu() -> MenuContents {
        let income = delegate.howMuchRemainMoney()
        let userMenu = delegate.listOfCanBuy()
        let userInventory = delegate.listOfInventory()
        return (income, userMenu, userInventory)
    }

    func add(detail: Int) throws {
        delegate.add(money: detail)
    }

    func delete(detail: Int) throws {
        do {
            try delegate.buy(productIndex: detail)
        } catch let error {
            throw error
        }

    }

}
