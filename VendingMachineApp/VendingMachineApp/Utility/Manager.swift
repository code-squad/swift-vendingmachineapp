//
//  Manager.swift
//  VendingMachine
//
//  Created by 이동건 on 24/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Manager {
    private weak var machine: VendingMachineManagerDelegate!
    var bundles: Bundles {
        return machine.bundles
    }
    
    init(_ machine: VendingMachineManagerDelegate) {
        self.machine = machine
    }
    
    private func addStock(beverage: Beverage, count: Int) {
        for _ in 0..<count {
            machine.add(beverage)
        }
    }
    
    private func removeStock(at index: Int) throws -> Beverage {
        guard let beverage = try machine?.remove(at: index) else { throw VendingMachineError.unknown }
        return beverage
    }
}

extension Manager: VendingMachineHandlerDelegate {
    typealias Menu = ManagerMenu
    
    func handle(_ menu: ManagerMenu, value: Int = 0) throws -> Comment? {
        switch menu {
        case .add:
            print(WareHouse.items, terminator: "")
            let (type, count) = try InputView.read(type: BeverageType.self)
            addStock(beverage: type.beverage, count: count)
            return .add(type.beverage, count)
        case .remove:
            OutputView.display(with: Comment.list(bundles, hasPrice: true))
            let index: Int = try InputView.read()
            let beverage = try removeStock(at: index)
            return .remove(beverage)
        case .exit:
            return nil
        }
    }
}
