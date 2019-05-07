//
//  Menu.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// MARK: - Struct Menu
struct Menu {

    static func moveHighStep(input: String) -> Bool {
        return input.contains("q")
    }

    static func readUserMode(input: String) throws -> UserMode {
        guard let number = Int(input) else { throw MenuError.notInt }
        guard let mode = UserMode(rawValue: number) else { throw MenuError.notMenu }
        return mode
    }

    static func readManagerMenu(input: String) throws -> ManagerMenuScript {
        guard let readData = Int(input) else { throw MenuError.noNumberGoods}
        guard let script = ManagerMenuScript(rawValue: readData) else { throw MenuError.notMenu}

        return script
    }

    static func readCustomerMenu(input: String) throws -> (details: CustomerMenuScript, value: Int) {
        let menuSelected = input.split(separator: " ")

        guard let firstScript = Int(menuSelected[0]) else {
            throw MenuError.notInt
        }

        guard let menu = CustomerMenuScript(rawValue: firstScript) else {
            throw MenuError.notMenu
        }

        if Int(menuSelected[0]) == 0 {
            return (menu, 0)
        }

        guard menuSelected.count == 2 else {
            throw MenuError.invalidForm
        }

        guard let value = Int(menuSelected[1]) else {
            throw MenuError.notInt
        }

        guard value > 0 else {
            throw MenuError.notNegativeNumber
        }

        return (menu, value)
    }

}
