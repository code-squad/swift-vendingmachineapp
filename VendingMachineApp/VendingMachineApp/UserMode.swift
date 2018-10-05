//
//  UserMode.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

struct UserMode {
    let userable: Userable
    
    init(with userable: Userable) {
        self.userable = userable
    }
    
    public func start(menuType: Menu, value: Int) throws {
        var isContinue = true
        while isContinue {
            isContinue = try self.selectMenu(with: menuType, value: value)
        }
    }
    
    public func selectMenu(with type: Menu, value: Int) throws -> Bool {
        switch type {
        case .addBalance:
            self.addBalance(value: value)
            return true
        case .purchaseBeverage:
            _ = try self.purchaseBeverage(value: value)
            return true
        case .historyList:
            _ = self.historyList()
            return true
        case .exit:
            return false
        }
    }
    
    private func addBalance(value: Int) {
        userable.addBalance(value: value)
    }
    
    private func purchaseBeverage(value: Int) throws -> Beverage {
        let isBalanceRemain = try userable.isAvailablePurchase(target: value, balance: userable.presentBalance())
        guard isBalanceRemain else { throw MachineError.lackBalance }
        guard let beverage = userable.remove(target: value) else { throw MachineError.outOfStock }
        return beverage
    }
    
    private func historyList() -> [Beverage] {
        let list = userable.historyList()
        return list
    }
}
