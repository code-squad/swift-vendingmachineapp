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

    private var enableMode: EnableMode?
    let core: CoreVendingMachine = {
        return CoreVendingMachine()
    }()
    var hasMode: Bool {
        return enableMode != nil
    }

    // 입력한 모드에 대한 처리. 모드에 따라 매니저와 자판기, 유저와 자판기 연결
    mutating func assignMode(mode: Mode) {
        switch mode {
        case .manager:
            enableMode = Manager(target: core)
        case .user:
            enableMode = User(target: core)
        }
    }

    func makeMenu() -> MenuContents? {
        if var enableMode = self.enableMode {
            return enableMode.makeMenu()
        }
        return nil
    }

    mutating func add(detail: Int) throws {
        do {
            try enableMode?.add(detail: detail)
        } catch let error {
            throw error
        }
    }
    
    mutating func delete(detail: Int) throws {
        do {
            try enableMode?.delete(detail: detail)
        } catch let error {
            throw error
        }
    }

    mutating func exitMode() {
        enableMode = nil
    }

    func makeResultOfOrder() -> Drink? {
        if let mode = enableMode as? User {
            return mode.selectDrink()
        }
        return nil
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
    enum ModeError: String, Error {
        case invalidNumber = "유효하지 않은 모드입니다."
    }
}
