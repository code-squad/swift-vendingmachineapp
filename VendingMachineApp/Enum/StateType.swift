//
//  StateType.swift
//  VendingMachine
//
//  Created by hw on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum StateType: Int {
    case modeSelect = 8
    case initialize = 9
    case ready = 0
    case chargeMoney = 1
    case sell = 2
    case addStock = 3
    case removeStock = 4
    case adminInitialize = 11
    case adminReady = 10
    
    init(value: Int) {
        switch (value) {
        case 9:
            self = .initialize
        case 0:
            self = .ready
        case 1:
            self = .chargeMoney
        case 2:
            self = .sell
        case 3:
            self = .addStock
        case 4:
            self = .removeStock
        case 8:
            self = .modeSelect
        case 11:
            self = .adminInitialize
        case 12:
            self = .adminReady
        default:
            self = .ready
        }
    }
    
    var description: String {
        switch self {
        case .chargeMoney:
            return "1. 금액추가"
        case .sell:
            return "2. 음료구매"
        case .addStock:
            return "1. 재고 보충"
        case .removeStock:
            return "2. 재고 비우기"
        case .modeSelect:
            return "8. 모드 선택지로"
        default:
            return ""
        }
    }
}
