//
//  Menu.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

enum Mode: Int, CaseIterable, CustomStringConvertible {
    case admin
    case user
    case exit
    
    var description: String {
        switch self {
        case .admin: return "관리자모드"
        case .user: return "사용자모드"
        case .exit: return "종료"
        }
    }
    
    public static func select(with type: Int ) throws -> Mode {
        switch type {
        case 1: return Mode.admin
        case 2: return Mode.user
        case 3: return Mode.exit
        default: throw InputError.rangeExceed
        }
    }
}

enum Menu: Int, CaseIterable, CustomStringConvertible {
    case addBalance
    case purchaseBeverage
    case historyList
    case exit
    
    var description: String {
        switch self {
        case .addBalance: return "금액추가"
        case .purchaseBeverage: return "음료구매"
        case .historyList: return "구매내역"
        case .exit: return "종료하기"
        }
    }
    
    public static func select(with type: Int ) throws -> Menu {
        switch type {
        case 1: return Menu.addBalance
        case 2: return Menu.purchaseBeverage
        case 3: return Menu.historyList
        case 4: return Menu.exit
        default: throw InputError.rangeExceed
        }
    }
}

enum MenuAdmin: Int, CaseIterable, CustomStringConvertible {
    case addStock
    case deleteStock
    case exit
    
    var description: String {
        switch self {
        case .addStock: return "재고추가"
        case .deleteStock: return "재고삭제"
        case .exit: return "종료하기"
        }
    }
    
    public static func select(with type: Int ) throws -> MenuAdmin {
        switch type {
        case 1: return MenuAdmin.addStock
        case 2: return MenuAdmin.deleteStock
        case 3: return MenuAdmin.exit
        default: throw InputError.rangeExceed
        }
    }
}
