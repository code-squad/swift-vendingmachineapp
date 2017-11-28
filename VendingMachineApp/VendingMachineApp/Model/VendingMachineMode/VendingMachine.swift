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
    private var enableMode: EnableMode?
    private var core: CoreVendingMachine
    var hasMode: Bool {
        return enableMode != nil
    }

    init() {
        core = CoreVendingMachine()
    }

    // 입력한 모드에 대한 처리. 모드에 따라 메니저와 자판기, 유저와 자판기 연결
    mutating func assignMode(mode: Int) throws {
        switch mode {
        case Mode.manager.rawValue:
            enableMode = Manager(target: core)
        case Mode.user.rawValue:
            enableMode = User(target: core)
        default:
            throw VendingMachine.ModeError.invalidNumber
        }
    }

    func makeMenu() -> MenuContents? {
        if var enableMode = self.enableMode {
            return enableMode.makeMenu()
        }
        return nil
    }

    mutating func action(action: Action) {
        switch action.option {
        case .add, .delete:
            do {
                try enableMode?.action(action: action)
            } catch CoreVendingMachine.stockError.soldOut {
                print(CoreVendingMachine.stockError.soldOut.rawValue)
            } catch CoreVendingMachine.stockError.invalidProductNumber {
                print(CoreVendingMachine.stockError.invalidProductNumber.rawValue)
            } catch CoreVendingMachine.stockError.empty {
                print(CoreVendingMachine.stockError.empty.rawValue)
            } catch let error {
                print(error)
            }
        case .exit:
            enableMode = nil
        }
    }
    
    func makeResultOfOrder() -> Drink? {
        if let mode = enableMode as? User {
            return mode.selectDrink()
        }
        return nil
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
