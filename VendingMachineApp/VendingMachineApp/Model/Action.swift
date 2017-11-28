//
//  Action.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 27..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Action {
    private var _option: Option
    enum Option: Int {
        case add = 1
        case delete, exit
    }
    private var _detail: Int
    var option: Option {
        return _option
    }
    var detail: Int {
        return _detail
    }

    init?(option: Int, detail: Int) {
        switch option {
        case Option.add.rawValue:
            self._option = .add
        case Option.delete.rawValue:
            self._option = .delete
        case Option.exit.rawValue:
            self._option = .exit
        default: return nil
        }
        self._detail = detail
    }
}
