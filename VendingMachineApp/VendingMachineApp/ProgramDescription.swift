//
//  ProgramDescription.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 3. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum ProgramDescription: CustomStringConvertible {
    case chooseMode
    case hasNoItem
    case unKnown
    case notEnoughBalance
    case outOfStock
    case askInputAgain
    case adminModeAction
    case quitVendingMachine
    case quitAdminMode
    case quitUserMode

    var description: String {
        switch self {
        case .chooseMode:
            return "자판기를 시작합니다.(종료를 원하면 \"q\"입력)\n1.관리자 모드\n2.사용자 모드\n입력>> "
        case .hasNoItem:
            return "상품이 존재하지 않습니다. - 관리자모드\n"
        case .unKnown:
            return "Unknown error - 관리자모드\n"
        case .notEnoughBalance:
            return "잔액 부족!\n"
        case .outOfStock:
            return "재고 없음!\n"
        case .askInputAgain:
            return "## 메뉴를 다시 입력해주세요. ##\n"
        case .adminModeAction:
            return "<< 관리자 모드 >>\n원하는 동작과 음료 번호를 선택하세요.\n"
        case .quitVendingMachine:
            return "## 자판기를 종료합니다 ## \n"
        case .quitAdminMode:
            return "## 관리자 모드를 종료합니다. ##\n"
        case .quitUserMode:
            return "## 사용자 모드를 종료합니다. ##\n"
        }

    }

}
