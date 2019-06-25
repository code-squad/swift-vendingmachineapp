//
//  ManagementMenu.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum ManagementMenu: Int, CaseIterable {
    case exit
    case supply
    case getStockList
    case getExpiredDrinkList
    case getHotDrinkList
    
    var localizedDescription: String {
        switch self {
        case .exit: return "종료"
        case .supply: return "재고 추가"
        case .getStockList: return "재고 확인"
        case .getExpiredDrinkList: return "만료된 재고 확인"
        case .getHotDrinkList: return "뜨거운 음료 재고 확인"
        }
    }
}
