//
//  Error.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

protocol Errorable: Error, CustomStringConvertible {
    var description: String { get }
}

enum InputError: Errorable {
    case unknown
    case incorrect
    case empty
    case rangeExceed
    
    var description: String {
        switch self {
        case .unknown:              return "알 수 없는 에러가 발생하였습니다."
        case .incorrect:            return "잘못 입력하셨습니다."
        case .empty:                return "입력값이 비어있습니다."
        case .rangeExceed:          return "입력범위를 초과하였습니다."
        }
    }
}

enum MachineError: Errorable {
    case lackBalance
    case outOfStock
    case outOfExpiredStock
    
    var description: String {
        switch self {
        case .lackBalance: return "잔액이 부족합니다."
        case .outOfStock: return "재고가 없습니다."
        case .outOfExpiredStock: return "유통기한이 지난 재고가 없습니다."
        }
    }
}
