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

    func makeMenu(_ mode: Mode) -> MenuContents? {
        var enableMode: EnableMode!
        switch mode {
        case .manager:
            enableMode = Manager(target: core)
        case .user:
            enableMode = User(target: core)
        }
        return enableMode.makeMenu()
    }

    func add(_ mode: Mode, detail: Int) throws {
        var enableMode: EnableMode!
        switch mode {
        case .manager:
            enableMode = Manager(target: core)
        case .user:
            enableMode = User(target: core)
        }
        do {
            try enableMode.add(detail: detail)
        } catch let error {
            throw error
        }
    }
    
    func delete(_ mode: Mode, detail: Int) throws {
        var enableMode: EnableMode!
        switch mode {
        case .manager:
            enableMode = Manager(target: core)
        case .user:
            enableMode = User(target: core)
        }
        do {
            try enableMode.delete(detail: detail)
        } catch let error {
            throw error
        }
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
}
