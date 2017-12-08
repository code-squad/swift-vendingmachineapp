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
    func makeMenu() -> MenuContents
    func add(detail: Int) throws
    func delete(detail: Int) throws
}
