//
//  VendingMachineError.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum VendingMachineError: Error, CustomStringConvertible {
    var description: String {
        switch self {
        case .outOfBudget:
            return "❌ 금액이 부족합니다. ❌"
        case .outOfStock:
            return "❌ 재고가 존재하지 않습니다. ❌"
        case .unknown:
            return "👻 알 수 없는 오류가 발생하였습니다. 👻"
        }
    }
    case outOfBudget
    case outOfStock
    case unknown
}
