//
//  State.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

enum State: String {
    case success
    case notEnough
    case fail
    case notExist
    
    func convertString() -> String {
        switch self {
        case .success: return ""
        case .notEnough: return "재고가 부족합니다."
        case .notExist: return "메뉴에 있는 음료를 선택하시오."
        case .fail: return "잔액이 부족합니다."
        }
    }
}
