//
//  Manager.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Manager: EnableMode {
    private var delegate: ManagerModeDelegate

    init(target: ManagerModeDelegate) {
        delegate = target
    }

    func makeMenu() -> MenuContents {
        let income = delegate.howMuchIncome()
        let managerMenu = delegate.AllDrinkList()
        let managerInventory = delegate.listOfInventory()
        return MenuContents(money: income, menu: managerMenu, inventory: managerInventory)
    }

    func add(detail: Int) throws {
        do {
            try delegate.add(productIndex: detail)
        } catch let error {
            throw error
        }
    }

    func delete(detail: Int) throws {
        do {
            try delegate.delete(productIndex: detail)
        } catch let error{
            throw error
        }
    }

}
