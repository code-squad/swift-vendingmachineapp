//
//  VendingMachineErrors.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum VendingMachineErrors: Error {
    case outOfStock
    case notEnoughMoney
    case invalidValue
    case incorrectMoney
    case incorrectMode
    
    var localizedDescription: String {
        switch self {
        case .outOfStock:
            return "재고가 없습니다."
        case .notEnoughMoney:
            return "돈이 부족합니다."
        case .invalidValue:
            return "유효하지 않는 입력값입니다."
        case .incorrectMoney:
            return "유효하지 않은 형태의 돈입니다."
        case .incorrectMode:
            return "유효하지 않은 모드입니다."
        }
    }
}
