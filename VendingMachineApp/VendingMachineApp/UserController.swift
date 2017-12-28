//
//  BeverageBox.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation
// swiftlint:disable class_delegate_protocol
protocol UserDelegate {
    func getBalance() -> Int
    func getStockList() -> [Beverage: Int]
}

struct UserController {
    private var machine: UserVendingMachine
    init(with vendingMachineData: VendingMachineData) {
        self.machine = UserVendingMachine(with: vendingMachineData)
    }
}
