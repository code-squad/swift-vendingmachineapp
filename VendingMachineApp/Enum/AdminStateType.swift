//
//  AdminStateType.swift
//  VendingMachine
//
//  Created by hw on 16/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum AdminStateType: Int {
    case addStock = 1
    case removeStock = 2
    case modeSelect = 8
    case adminReady = 0
    
    init(value: Int) {
        switch (value) {
        case 0:
            self = .adminReady
        case 1:
            self = .addStock
        case 2:
            self = .removeStock
        case 8:
            self = .modeSelect
        default:
            self = .adminReady
        }
    }
    
    var description: String {
        switch self {
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
