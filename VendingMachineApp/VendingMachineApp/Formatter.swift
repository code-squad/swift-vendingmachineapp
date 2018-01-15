//
//  Formatter.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 15..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation

enum Formatter {
    case kor(Int)
    case eng(Int)
    var moneyUnit: String {
        switch self {
        case .kor(let value):
            guard let valueInCurrencyFormat = value.currency() else { return "원" }
            return valueInCurrencyFormat + "원"
        case .eng(let value):
            guard let valueInCurrencyFormat = value.currency() else { return "won" }
            return valueInCurrencyFormat + "원"
        }
    }
    var numberUnit: String {
        switch self {
        case .kor(let value): return "\(value)개"
        case .eng(let value): return "\(value)"
        }
    }
}
