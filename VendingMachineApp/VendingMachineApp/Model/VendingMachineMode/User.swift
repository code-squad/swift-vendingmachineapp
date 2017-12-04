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
    private var drink: Drink?

    init(target: UserModeDelegate) {
        delegate = target
    }

    mutating func makeMenu() -> MenuContents {
        let income = delegate.howMuchRemainMoney()
        let userMenu = delegate.listOfCanBuy()
        let userInventory = delegate.listOfInventory()
        return (.user, income, userMenu, userInventory)
    }

    mutating func add(detail: Int) throws {
        delegate.add(money: detail)
    }

    mutating func delete(detail: Int) throws {
        do {
            drink = try delegate.buy(productIndex: detail)
        } catch let error {
            throw error
        }

    }
    
    func selectDrink() -> Drink? {
        return drink
    }

}
