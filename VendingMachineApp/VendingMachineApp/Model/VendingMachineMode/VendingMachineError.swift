//
//  VendingMachineError.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 14..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

enum VendingMachineError: Error {
    case stockError
    case shortageOfMoney
    var localizedDescription: String {
        switch self {
        case .stockError: return "재고가 하나도 없습니다."
        case .shortageOfMoney: return "잔액이 부족합니다."
        }
    }
}


public extension Error {
    var localizedDescription: String {
        return (self as! VendingMachineError).localizedDescription
    }
}
