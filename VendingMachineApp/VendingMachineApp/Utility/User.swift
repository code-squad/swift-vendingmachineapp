//
//  User.swift
//  VendingMachine
//
//  Created by 이동건 on 24/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class User {
    private weak var machine: VendingMachineUserDelegate!
    var bundles: BeverageBundles {
        return machine.bundles
    }
    var remain: Int {
        return machine.remain
    }
    
    init(_ machine: VendingMachineUserDelegate) {
        self.machine = machine
    }
    
    private func buy(at index: Int) throws -> (Beverage, Int) {
        if index < 0 || index > bundles.count { throw InputError.wrongInput }
        return try machine.buy(at: index)
    }
    
    private func deposit(_ money: Int) throws {
        if money < 0 { throw InputError.wrongInput }
        machine.deposit(money)
    }
}

extension User: VendingMachineHandlerDelegate {
    typealias Menu = UserMenu
    
    func handle(_ menu: UserMenu, value: Int) throws -> Comment? {
        switch menu {
        case .deposit:
            // OutputView 처리
            try deposit(value)
            return .introdution(account: value)
        case .purchase:
            // OutputView 처리
            let (beverage, price) = try buy(at: value)
            return .buy(beverage: beverage, price: price)
        case .history:
            let history = machine.userHistory
            return .history(history: history)
        case .exit:
            return nil
        }
    }
    
}
