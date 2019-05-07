//
//  MenuScript.swift
//  VendingMachine
//
//  Created by Elena on 08/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// MARK: - Protocol MessagePrintable
protocol MessagePrintable {
    var message: String { get }
}

// MARK: - enum CustomerMenuScript
enum CustomerMenuScript: Int, CaseIterable {
    case addMoney = 1, buyBeverage

    var customerMessage: String {
        switch self {
        case .addMoney:
            return "금액추가"
        case .buyBeverage:
            return "음료구매"
        }
    }
}

// MARK: - enum ManagerMenuScript
enum ManagerMenuScript: Int, CaseIterable {
    case addBeverage = 1, removeBeverage, removeGoBadBeverages

    var managerMessage: String {
        switch self {
        case .addBeverage:
            return "재고 추가"
        case .removeBeverage:
            return "재고 삭제"
        case .removeGoBadBeverages:
            return "기한만료 재고삭제"
        }
    }
}

// MARK: - enum MenuError
enum MenuError: Error, MessagePrintable {
    case invalidForm
    case noNumberGoods
    case notMenu
    case notInt
    case notNegativeNumber
    case notDefine

    private var manual: String {

        switch self {
        case .invalidForm:
            return "메뉴와 값 사이에 띄워서 입력해주세요.\n ex) 0.잔돈 반환 --> 0 \n \t 1.금액 추가 --> 1 2000\n \t 2.음료 구매 --> 2 1 \n \t "
        case .noNumberGoods:
            return "입력한 번호가 없습니다."
        case .notMenu:
            return "지원하는 메뉴를 입력해주세요."
        case .notInt:
            return "숫자로 입력해주세요.\n "
        case .notNegativeNumber:
            return "숫자는 양수로 입력해주세요."
        case .notDefine:
            return "알수 없는 오류입니다."
        }
    }

    var message: String {
        return "잘못 입력하셨습니다. \(self.manual)"
    }

}

// MARK: - enum UserMode
enum UserMode: Int, CaseIterable {
    case manager = 1, customer

    var mode: String {
        switch self {
        case .manager:
            return "관리자 모드"
        case .customer:
            return "사용자 모드"
        }
    }
}

enum VendingMachineError: Error, MessagePrintable {
    case beSoldOut
    case notAddition
    case impossible

    var message: String {
        switch self {
        case .beSoldOut:
            return "⚠️ 품절 ⚠️\n"
        case .notAddition:
            return "추가된 적이 없는 음료 입니다."
        case .impossible:
            return "재고가 없습니다."
        }
    }
}
