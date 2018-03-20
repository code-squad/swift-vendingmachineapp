//
//  CustomEnum.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 3. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// 에러 케이스 enum
enum Exception: Error {
    case notEnoughBalance
    case outOfStock

    var description: ProgramDescription {
        switch self {
        case .notEnoughBalance:
            return ProgramDescription.notEnoughBalance
        case .outOfStock:
            return ProgramDescription.outOfStock
        }
    }
}

enum ProgramMode {
    case admin
    case user
    case none
    case quit
}

enum AdminMenu {
    case addItem
    case deleteItem
    case none
    case quit
}

enum UserMenu {
    case addBalance
    case buyItem
    case none
    case quit
}

// 음료수의 용기 패키지 타입 enum 선언
enum Package {
    case can
    case bottle
    case pet
    case carton
}
