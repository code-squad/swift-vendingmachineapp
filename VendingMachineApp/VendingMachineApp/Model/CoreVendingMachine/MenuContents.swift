//
//  MenuContents.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 11..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

struct MenuContents {
    let money: Int
    let menu: [Drink]
    let inventory: [Drink: Count]

    init(money: Int, menu: [Drink], inventory: [Drink: Count]) {
        self.money = money
        self.menu = menu
        self.inventory = inventory
    }
}
