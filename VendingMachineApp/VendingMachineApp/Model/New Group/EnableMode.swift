//
//  Person.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 23..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias MenuContents = (mode: Mode, money: Int, menu: [Drink], inventory: [Drink: Count])

protocol EnableMode {
    mutating func makeMenu() -> MenuContents
    mutating func action(action: Action) throws
}
