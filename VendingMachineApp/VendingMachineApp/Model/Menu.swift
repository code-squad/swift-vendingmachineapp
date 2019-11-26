//
//  UserMenu.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Menu: CustomStringConvertible {
    var description: String { get }
}

enum ManagerMenu: Int, CaseIterable, Menu {
    case addStock = 1
    case removeStock
    
    var description: String {
        switch self {
        case .addStock:
            return "\(rawValue). 음료 추가"
        case .removeStock:
            return "\(rawValue). 음료 제거"
        }
    }
}

enum UserMenu: Int, CaseIterable, Menu {
    case insertMoney = 1
    case purchaseBeverage
    
    var description: String {
        switch self {
        case .insertMoney:
            return "\(rawValue). 금액 추가"
        case .purchaseBeverage:
            return "\(rawValue). 음료 구매"
        }
    }
}
