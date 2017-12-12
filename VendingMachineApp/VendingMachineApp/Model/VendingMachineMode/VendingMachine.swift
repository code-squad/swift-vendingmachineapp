//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 23..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias Mode = VendingMachine.Mode

struct VendingMachine {
    static let sharedInstance: VendingMachine = VendingMachine()
    private let core: CoreVendingMachine

    init() {
        core = CoreVendingMachine()
    }

    func add(_ mode: Mode, detail: Int) {
        var enableMode: EnableMode!
        switch mode {
        case .manager:
            enableMode = Manager(target: core)
        case .user:
            enableMode = User(target: core)
        }
        enableMode.add(detail: detail)
    }
    
    func delete(_ mode: Mode, detail: Int) throws {
        var enableMode: EnableMode!
        switch mode {
        case .manager:
            enableMode = Manager(target: core)
        case .user:
            enableMode = User(target: core)
        }
        if enableMode.delete(detail: detail) == nil {
            throw stockError.empty
        }
    }

    func listOfPurchase() -> [Drink] {
        let user = User(target: core)
        return user.purchases
    }

    func countOfDrinks() -> [Count] {
        let manager = Manager(target: core)
        return manager.countOfDrinks
    }

    func remainMoney() -> Price {
        let user = User(target: core)
        return user.remainMoney
    }

    func saveChanges() -> Bool {
        return core.saveChanges()
    }

}

extension VendingMachine {
    enum Mode: Int {
        case manager = 1
        case user = 2
    }

    enum stockError: String, Error {
        case empty = "재고가 하나도 없습니다."
    }

}
